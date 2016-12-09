# Right now, when the user choses an option from our menu, there's no way of them
# knowing if the action was successful. Can you fix this and implement feedback
# messages for the user?

@students = [] # an empty array accessible to all methods


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  count = 0
  while !name.empty? do
    #add the student hash to the array using student method
    add_students(name)
    count += 1
    puts @students.length == 1 ? ("Now we have #{@students.count} student") : ("Now we have #{@students.count} students")
    #get another name from the user
    name = STDIN.gets.chomp
  end
  puts "You have input #{count} students"
end


def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil?
  if File.exists?(filename) # if file passed as ARGV.first exists
    load_students(filename) # go to method load students with filename as argument
    puts "Loaded #{@students.count} from #{filename}"
  else # if the file doesn't exist
    puts "Sorry, #{filename} doesnt exist"
    exit # quit the program
  end
end


def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  file.close
end
puts "File has been loaded"
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
  puts "The file has been saved."
  file.close
end


def interactive_menu
  loop do
    print_menu
    menu_selection(STDIN.gets.chomp)
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


def menu_selection(selection)
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
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end


def print_footer
  puts @students.length == 1 ? ("Overall, we have #{@students.count} great student") : ("Overall, we have #{@students.count} great students")
end


def add_students(name, cohort = :november) # pass arguments name and cohort, if cohort not specified
  # which it isn't in the method input students, then use november as default.
  @students << {name: name, cohort: cohort}
end

# nothing happens until we call the methods
try_load_students
interactive_menu
