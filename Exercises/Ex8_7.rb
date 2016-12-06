# In the input_students method the cohort value is hard-coded. How can you ask
# for both the name and the cohort? What if one of the values is empty? Can you
# supply a default value? The input will be given to you as a string? How will you
# convert it to a symbol? What if the user makes a typo?

def input_students
  puts "Please enter the names of the students".center(50)
  puts "To finish, just hit return twice".center(50)
  # create empty array
  students = []
  cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # ask for cohort information
    puts "What cohort are they in?".center(50)
    cohort = gets.chomp
    # check for typos or insert default if empty
      unless (cohorts.include? cohort.downcase.to_sym) || (cohort == "")
      puts "We have detected a typo, please re-enter the cohort".center(50)
      cohort = gets.chomp
      end
    students << {name: name, cohort: (cohort.empty? ? :unknown : cohort.downcase.to_sym)}
    puts "Now we have #{students.count} students".center(50)
    puts "Please enter the next name".center(50)
    #get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of the Villains Academy".center(50)
  puts "-------------".center(40)
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
