# basic version, for additional methods see test_directory.rb
def interactive_menu
  students = []
  loop do
# 1. print options and ask for input
    puts "1. Input students"
    puts "2. Show students"
    puts "9. Exit"
# 2. save input to variable
    selection = gets.chomp
# 3. do the correct action
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what that means, try again."
    end
  end 
end


def input_students
  puts "Enter student record:"
  puts "(hit return twice to finish)"
  students = []
  name = gets.chomp
  while !name.empty? do 
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students."
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
  students.each_with_index do |student, index| 
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end


interactive_menu
# students = input_students
# print_header
# print(students)
# print_footer(students)