# Rewrite the each() method that prints all students using while or until control flow methods

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

# Note: have to use the [count] after students as it is position count in the students array
def print_usingwhile(students)
  count = 0
  while count < students.length
    puts "#{students[count][:name]} (#{students[count][:cohort]} cohort)"
    count +=1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print_usingwhile(students)
print_footer(students)
