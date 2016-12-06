# Our code only works with the student name and cohort. Add more information:
# hobbies, country of birth, height, etc.

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #get extra information
    puts "What are their hobbies?"
    hobbies = gets.chomp
    puts "What is their birth place?"
    birth_place = gets.chomp
    puts "What is their height in cm?"
    height = gets.chomp
    #add the student has to the array
    students << {name: name, hobbies: hobbies, birth_place: birth_place, height: height, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of the Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    puts "Their hobbies include #{student[:hobbies]}, they were born at #{student[:birth_place]}
    and they are #{student[:height]} tall"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
