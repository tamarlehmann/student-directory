# The filename we use to save and load data (menu items 3 and 4) is hardcoded.
# Make the script more flexible by asking for the filename if the user chooses these menu items.

@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    #add the student has to the array
    @students << {name: name, cohort: :november}
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
  file = File.open(filename, "r") # open the file for reading
  file.readlines.each do |line| # read all lines into an array and iterate over it.
  name, cohort = line.chomp.split(",") # on every iteration we discard the training
  # new line character from the line, split it at the comma (giving an array with 2 elements)
  # and assign it to the name and cohort variables.
    add_students(name, cohort)
  end
  puts "Students successfully loaded from #{filename}"
end

def add_students(name, cohort = :november) # pass arguments name and cohort, if cohort not specified
  # which it isn't in the method input students, then use november as default.
  @students << {name: name, cohort: cohort}
end

def save_students(filename)
  file = File.open(filename, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "Students successfully saved to file"
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
  puts "3. Save the list of students"
  puts "4. Load the list of students"
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
      save_students(choose_file)
    when "4"
      load_students(choose_file)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
end

def choose_file
  puts "Please enter the filename"
  file = STDIN.gets.chomp
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

# nothing happens until we call the methods
try_load_students
interactive_menu
