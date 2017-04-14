require 'open-uri'
require 'json'
require_relative 'project_view'

BASE_URL = "https://data.cityofnewyork.us/resource/uvxr-2jwn.json"

json_string_response = open(BASE_URL + "?").read

ruby_hash_response = JSON.parse(json_string_response)

def death(sex,race,ruby_hash_response)
  deaths_from_2013 = ruby_hash_response.map do |d|
    if d["sex"] == sex && d['race_ethnicity'] == race && d["year"] == "2013"
      d
    end
  end
  deaths_from_2013.compact.sort_by do |i|
    i['death_rate'].to_f
    end.reverse.each_with_index do |i, index|
      if i['death_rate'] == "."
        i['death_rate'] = "Unknown"
      end
      puts "#{index+1}. #{i["leading_cause"]}\n   Death Rate: #{i["death_rate"]}\n\n"
  end
  gets.chomp
  system "clear"
  puts "\n\n\nThis data was provided free of charge by the New York City Department of Health and Mental Hygiene (DOHMH)\n\n"
  puts "\n\n🌞  Have a Great Day! 🌞\n\n\n"
end

user_input(ruby_hash_response)
