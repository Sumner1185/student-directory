def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty?
    cohort = input_cohort
    @students << {name: name.gsub(/\w+/, &:capitalize), cohort: cohort}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end
def input_cohort
  cohorts = [:January, :February, :March, :April, :May, :June, 
  :July, :August, :September, :October, :November, :December]
  puts "Please add the students cohort"
    cohort = gets.capitalize.chomp.to_sym
    unless cohorts.include?(cohort)
        puts "Type error"
        input_cohort
    end
    cohort
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print_student_list
  if @students.length >= 1
    @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  else
    puts "Student list empty"
    input_students
  end
end
def print_footer
  puts "Overall, we have #{@students.count} great students"
end
def interactive_menu
  loop do
    menu = print_menu
    process(gets.chomp)
  end
end
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end
def show_students
  print_header
  print_student_list
  print_footer
end
def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show = show_students
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
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

@students = []
menu = interactive_menu