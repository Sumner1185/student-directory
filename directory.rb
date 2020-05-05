def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty?
    cohort = input_cohort
    @students << {name: name.capitalize, cohort: cohort}
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
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

@students = []
menu = interactive_menu