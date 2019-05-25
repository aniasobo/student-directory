# additional methods in test_directory.rb
@students = []

def print_menu
  puts "1. Input students"
  puts "2. Show students"
  puts "3. Save file students.csv"
  puts "4. Load students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      puts "You picked 1. Input students"
      input_students
    when "2"
      puts "You picked 2. Show students"
      show_students
    when "3"
      puts "You picked 3. Save"
      save_students
    when "4"
      puts "You picked 4. Load students.csv"
      load_students
    when "9"
      puts "bye!"
      exit
    else
      puts "I don't know what that means, try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end

def input_students
  puts "Enter student record:"
  puts "(hit return twice to finish)"
  name = STDIN.gets.chomp
  while !name.empty? do 
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students."
    name = STDIN.gets.chomp
  end
end

def load_students #(filename = "students.csv")
  puts "Enter name of file"
  filename = STDIN.gets.chomp
  File.open(filename, "r") do |file|
    file.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
end
#  file = File.open(filename, "r")
#  file.readlines.each do |line|
#    name, cohort = line.chomp.split(',')
#    @students << {name: name, cohort: cohort.to_sym}
#  end
#  file.close
end

def try_load_students
  filename = ARGV.first # first argument from command line
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doens't exist."
    exit
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_students_list
  @students.each_with_index do |student, index| 
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students."
end

interactive_menu
# load_students loads with default value
# load_students(argument) loads given file