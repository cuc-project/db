require 'rake'
require 'rest_client'
require 'csv'

desc "Sync with the remote Google Drive database"
task :sync => :environment do
  import_competitions
  import_questions
end

def import_questions
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

def import_competitions
  seeds = RestClient.get(ENV['GOOGLE_COMPETITIONS_URL'])
  split = seeds.split("\n")
  split[0] = "timestamp,competition,tour,season,cup_name,elitar_name,level,date,authors,editors,number_questions,additional_info,game_slug,submitter"
  seeds = split.join("\n")

  csv = CSV.new(seeds, :headers => true, :header_converters => :symbol, :converters => :all)
  data = csv.to_a
  data.reject!{ |row| row[0].nil? }
  data.map!(&:to_hash)
  data.each{ |item| item.delete(:timestamp) }
  binding.pry
  data.each{ |item| item[:date] = DateTime.strptime(item[:date], "%m/%e/%Y") }

  binding.pry

  p "Imported #{data.size} games"
  Game.destroy_all
  Game.create!(data)
end