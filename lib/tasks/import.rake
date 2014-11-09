require 'rake'
require 'rest_client'
require 'csv'

desc "Sync with the remote Google Drive database"
task :sync => :environment do
  seeds = RestClient.get(ENV['GOOGLE_DRIVE_URL'])

  split = seeds.split("\n")
  split[0] = "timestamp,number,text,answer,acceptance_criteria,comment,source,authors_names,game_slug,team_name"
  seeds = split.join("\n")

  # Parse the CSV
  csv = CSV.new(seeds, :headers => true, :header_converters => :symbol, :converters => :all)
  data = csv.to_a
  data.map!(&:to_hash)
  data.each{ |item| item.delete(:timestamp) }
  data = data.delete_if { |item| item[:number] == nil }

  p "Imported #{data.size} questions"
  Question.destroy_all
  Question.create!(data)
end