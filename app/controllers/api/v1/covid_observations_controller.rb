class Api::V1::CovidObservationsController < ApplicationController
  before_action :set_covid_observation, only: :confirmed
  def confirmed
    render json: {
      observation_date: @observation_date || nil, countries: covid_json_data
    }
  end

  private

  def set_covid_observation
    @observation_date = Date.parse(params[:observation_date]) rescue nil
    @covid_observations = CovidObservation.select("country, sum(confirmed) as confirmed,
                                                    sum(deaths) as deaths,
                                                    sum(recovered) as recovered")
                                          .order("country asc")
                                          .group("country")
                                          .where(observation_date: @observation_date)
  end

  def covid_json_data
    @covid_observations
      .limit(params[:max_results] || 10)
      .as_json(only: [:country, :confirmed, :deaths, :recovered])
  end
end
