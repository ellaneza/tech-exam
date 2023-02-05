require 'csv'

csv_data = File.read(Rails.root.join('lib/covid_19_data.csv'))
data_from_csv = CSV.parse(csv_data, headers: true, encoding: 'utf-8')
covid_observations = data_from_csv.map do |row|
  raw_data = {}
  raw_data[:id] = row[row.headers.first]
  raw_data[:observation_date] = Date.strptime(row['ObservationDate'], '%m/%d/%Y')
  raw_data[:province] = row['Province/State']
  raw_data[:country] = row['Country/Region']
  raw_data[:last_updated] = DateTime.strptime(row['LastUpdate'],
      '%m/%d/%Y %H:%M') rescue DateTime.parse(row['LastUpdate'])
  raw_data[:confirmed] = row['Confirmed']
  raw_data[:deaths] = row['Deaths']
  raw_data[:recovered] = row['Recovered']
  raw_data[:created_at] = DateTime.current
  raw_data[:updated_at] = DateTime.current
  raw_data
end

CovidObservation.upsert_all(covid_observations)
puts "#{ CovidObservation.count } record has been pushed"

User.create(email: 'ellaneza@test.com', password: 'password')
puts "Test user added"