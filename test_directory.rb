@students = []

def print_menu
  puts "1. Input students"
  puts "2. Input cohort"
  puts "3. Save file to test_students.csv"
  puts "4. Load from file test_students.csv"
  puts "5. Show students"
  puts "6. Show students by cohort"
  puts "7. Show students by letter"
  puts "8. Show students by character number"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      input_cohort
    when "3"
      save_students
    when "4"
      load_students
    when "5"
      show_students
    when "6"
      print_by_cohort
    when "7"
      print_by_letter
    when "8"
      length_selected
    when "9"
      exit
    else
      puts "I don't know what that means, try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  file = File.open("test_students.csv", "w")
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
  name = gets.chomp
  while !name.empty? do 
    @students << {name: name}
    if @students.count == 1
      puts "Now we have our first student"
    else
      puts "Now we have #{@students.count} students."
    end
    name = gets.chomp
  end
end

# assigns chosen cohort to chosen student
def input_cohort
  loop do
    puts "Choosing cohort"
    puts "Choose candidate to assign cohort to:"
    name = gets.chomp
    puts "Choose cohort for #{name}"
    cohort = gets.chomp
    @students.find do |student|  
      if student[:name] == name 
        student[:cohort] = cohort
      end
    end
    puts "Do you wish to assing another? Y/N"
    answer = gets.chomp
    break if answer == "N" 
  end
end

# displays students by cohort
def print_by_cohort
  students_by_cohort = {}
  @students.each do |student|
    cohort = student[:cohort]
    name = student[:name]
    if students_by_cohort[cohort] == nil
      students_by_cohort[cohort] = []
    end
    students_by_cohort[cohort].push(name)
  end
  loop do 
    puts "Choose cohort to display. Say stop to exit"
    choice = gets.chomp
    break if choice == "stop"
    puts students_by_cohort[choice].join(', ')
  end
end

def load_students
  file = File.open("test_students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
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

# this method asks the user for a letter to sort by
def print_by_letter
  puts "Enter letter to sort by"
  letter = gets.chomp.upcase
  @students.each do |student|
    if "#{student[:name]}".start_with?(letter) == true
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# this method asks user for character limit
def length_selected
  puts "Enter max number of characters"
  num = gets.chomp.to_i
  @students.each do |student|
    if "#{student[:name]}".length <= num
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end 
end

interactive_menu
# input_cohort
# print_by_cohort
# print_by_letter
# length_selected
# print_footer

# students = [
#  {name: "Dr Doom", cohort: :november}, 
#  {name: "Thanos", cohort: :november},
#  {name: "Viktor Vaughn", cohort: :november}, 
#  {name: "Bill", cohort: :november}, 
#  {name: "Elle Driver", cohort: :november},
#  {name: "Hydra", cohort: :november}, 
#  {name: "Oren Ishii", cohort: :november}, 
#  {name: "Rodan", cohort: :november}, 
#  {name: "Wilson Fisk", cohort: :november}, 
#  {name: "King Gidorah", cohort: :november},  
#  {name: "Smoke Monster", cohort: :november}
# ]

