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

students = input_students
print_header
print_by_letter(students)
# print(students)
print_footer(students)



