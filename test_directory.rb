def input_students
  puts "Enter student record:"
  puts "(hit return twice to finish)"
  students = []
  name = gets.chomp
  while !name.empty? do 
    students << {name: name}
    if students.count == 1
      puts "Now we have our first student"
    else
      puts "Now we have #{students.count} students."
    end
    name = gets.chomp
  end
  students
end

# assigns chosen cohort to chosen student
def input_cohort(students)
  loop do
    puts "Choosing cohort"
    puts "Choose candidate to assign cohort to:"
    name = gets.chomp
    puts "Choose cohort for #{name}"
    cohort = gets.chomp
    students.find do |student|  
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
def print_by_cohort(students)
  students_by_cohort = {}
  students.each do |student|
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

# this method asks the user for a letter to sort by
def print_by_letter(students)
  puts "Enter letter to sort by"
  letter = gets.chomp.upcase
  students.each do |student|
    if "#{student[:name]}".start_with?(letter) == true
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# this method asks user for character limit
def length_selected(students)
  puts "Enter max number of characters"
  num = gets.chomp.to_i
  students.each do |student|
    if "#{student[:name]}".length <= num
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end 
end

students = input_students
print_header
input_cohort(students)
print_by_cohort(students)
# print_by_letter(students)
# length_selected(students)
# print(students)
print_footer(students)

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

