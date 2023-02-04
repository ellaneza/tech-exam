class CreateCovidObservations < ActiveRecord::Migration[6.0]
  def change
    create_table :covid_observations do |t|
      t.date :observation_date
      t.string :province
      t.string :country
      t.integer :confirmed
      t.integer :deaths
      t.integer :recovered
      t.datetime :last_updated

      t.timestamps
    end
  end
end
