# Once you complete the previous exercise, change the way the users are displayed:
# print them grouped by cohorts. To do this, you'll need to get a list of all existing
# cohorts (the map() method may be useful but it's not the only option), iterate over
# it and only print the students from that cohort.

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

def print_bycohort(students)
  #create an array called cohorts which is made up of existing cohorts
  cohorts = students.map { |student| student[:cohort]}.uniq
  cohorts.each do |cohort|
    puts "Students in #{cohort} cohort:"
    students.each do |student|
      if student[:cohort] == cohort
        puts "#{student[:name]} (#{student[:cohort]} cohort)".center(50)
      else
      end
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

# nothing happens until we call the methods
students = input_students
print_header
#print(students)
print_bycohort(students)
print_footer(students)
