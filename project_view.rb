def user_input(ruby_hash_response)
  system "clear"
  print_line = "💀   ❌  "*10
  puts print_line
  puts "\n\nWELCOME TO THE DEATH SEARCH\n\n\n"
  puts "What sex are you searching for?"
  puts "There is only data provided for male or female.\n\n"
    puts "1. Male 👱"
    puts "2. Female 👩\n\n"
  sex_input = gets.chomp.to_i
  until sex_input.between?(1,2)
    puts "\nPlease enter 1 or 2"
    sex_input = gets.chomp.to_i
  end
  system "clear"

  puts print_line
  puts "\n\nWhat race are you searching for?"
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

  if sex_input == 1
    sex = "M"
    sex_print = "Males"
  else
    sex = "F"
    sex_print = "Females"
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
  system "clear"

  puts print_line
  puts "\n\nThe leading causes of death for #{race} #{sex_print}:\n\n\n"
  death(sex,race,ruby_hash_response)
end
