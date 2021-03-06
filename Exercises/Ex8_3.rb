# Modify your program to only print the students whose name is shorter than 12 characters.

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student has to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get naother name from the user
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
  end
end

def print_chars(students)
  students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    else
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print_chars(students)
print_footer(students)
