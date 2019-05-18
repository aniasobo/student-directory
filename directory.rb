students = [
  {name: "Dr Doom", cohort: :november}, 
  {name: "Thanos", cohort: :november},
  {name: "Viktor Vaughn", cohort: :november}, 
  {name: "Bill", cohort: :november}, 
  {name: "Elle Driver", cohort: :november},
  {name: "Hydra", cohort: :november}, 
  {name: "Oren Ishii", cohort: :november}, 
  {name: "Rodan", cohort: :november}, 
  {name: "Wilson Fisk", cohort: :november}, 
  {name: "King Gidorah", cohort: :november},  
  {name: "Smoke Monster", cohort: :november}
]

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

print_header
print(students)
print_footer(students)