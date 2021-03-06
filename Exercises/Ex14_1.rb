@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array using student method
    add_students(name)
    if @students.length == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    #get another name from the user
    name = STDIN.gets.chomp
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isnt given
  if File.exists?(filename) # if file passed as ARGV.first exists
    load_students(filename) # go to method load students with filename as argument
    puts "Loaded #{@students.count} from #{filename}"
  else # if the file doesn't exist
    puts "Sorry, #{filename} doesnt exist"
    exit # quit the program
  end
end


def load_students(filename = "students.csv") # method accepts the filename as an arguemnts. If not supplied
  # the value students.csv will be used. This is the default value for the argument.
  file = File.open("students.csv", "r") # open the file for reading
  file.readlines.each do |line| # read all lines into an array and iterate over it.
  name, cohort = line.chomp.split(',') # on every iteration we discard the training
  # new line character from the line, split it at the comma (giving an array with 2 elements)
  # and assign it to the name and cohort variables.
    add_students(name, cohort) # pass to method where students hash added to array of students.
  end
  file.close # close the file
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "a")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
    case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
end

def print_header
  puts "The students of the Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" # note: no '@' on string interpolation as referencing
    # an iteration of the students array, called student.
  end
end

def print_footer
  if @students.length == 1
    puts "Overall, we have #{@students.count} great student"
  elsif @students.length > 1
    puts "Overall, we have #{@students.count} great students"
  end
end

def add_students(name, cohort = :november) # pass arguments name and cohort, if cohort not specified
  # which it isn't in the method input students, then use november as default.
  @students << {name: name, cohort: cohort.to_sym}
end

# nothing happens until we call the methods
try_load_students
interactive_menu
