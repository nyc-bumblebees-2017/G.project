require 'open-uri'
require 'json'

BASE_URL = "https://data.cityofnewyork.us/resource/uvxr-2jwn.json"
# DEATH_QUERY = "plate_id="


# # get user input (this would be a concern for your View)
# puts "what is the license plate number you want to search for?"
# user_input = gets.chomp

# make http request to api endpoint for specific plate_id,
# which will return a json string in http response:
# json_string_response = open(BASE_URL + "?" + DEATH_QUERY + user_input).read
json_string_response = open(BASE_URL + "?").read

# parse json string into a Ruby array of hashes
ruby_hash_response = JSON.parse(json_string_response)




# now you can manipulate the data in the Ruby hashes
# (encapsulate into Ruby objects, etc.)
# here are the Ruby hashes:
# rates = []
# ruby_hash_response.each do |d|
#   if d["death_rate"].to_i > 200
#     rates << d
#   end
# end

# rates.each {|i| p i}
def death(sex,race,ruby_hash_response)
  deaths_from_2013 = []
  ruby_hash_response.each do |d|
    if d["year"] == "2013"
      deaths_from_2013 << d
    end
  end

  deaths_from_2013.map! do |d|
    if d["sex"] == sex && d['race_ethnicity'] == race
      d
    end
  end
  deaths_from_2013.compact.sort_by {|i| i['death_rate']}.each_with_index {|i, index| puts "#{index+1}. #{i["leading_cause"]}\n   Death Rate: #{i["death_rate"]}\n\n" }
end



puts "What sex are you searching for?"
puts "There is only data provided for male or female.\n\n"
puts "1. Male"
puts "2. Female\n\n"
sex_input = gets.chomp.to_i
until sex_input.between?(1,2)
  puts "\nPlease enter 1 or 2"
  sex_input = gets.chomp.to_i
end
puts "\nWhat race are you searching for?"
puts "There is only data provided for the following declared races/ethnicities.\n\n"
puts "1. Asian and Pacific Islander"
puts "2. Black Non-Hispanic"
puts "3. Hispanic"
puts "4. White Non-Hispanic"
puts "5. Not Stated/Unknown\n\n"
race_input = gets.chomp.to_i
until race_input.between?(1,5)
  puts "\nPlease enter a number between 1 and 5."
    race_input = gets.chomp.to_i
  end
puts "\nThe leading causes of death based on your input are:\n\n"


if sex_input == 1
  sex = "M"
else sex = "F"
end
if race_input == 1
  race = "Asian and Pacific Islander"
elsif race_input == 2
  race = "Black Non-Hispanic"
elsif race_input == 3
  race = "Hispanic"
elsif race_input == 4
  race = "White Non-Hispanic"
else race = "Not Stated/Unknown"
end

death(sex,race,ruby_hash_response)
