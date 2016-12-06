# We've been using the chomp() method to get rid of the last return character.
# Find another method among those provided by the String class that could be used
# for the same purpose (although it will require passing some arguments).

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create empty array
  students = []
  # get the first name
  name = gets.delete("\n")
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student has to the array
    students << {name: name, cohort: :november}
    if students.length == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    #get naother name from the user
    name = gets.delete("\n")
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

def print_footer(students)
  if students.length == 1
    puts "Overall, we have #{students.count} great student"
  elsif students.length > 1
    puts "Overall, we have #{students.count} great students"
  end
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
