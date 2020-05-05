def input_students
  cohorts = [:January, :February, :March, :April, :May, :June, 
    :July, :August, :September, :October, :November, :December]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty?
    puts "Please add the students cohort"
    cohort = gets.capitalize.chomp.to_sym
    unless cohorts.include?(cohort)
      puts "Type error: please enter student and cohort again"
    else
      students << {name: name, cohort: cohort}
    end
    if students.length == 1 
      puts "Now we have #{students.count} student"
    elsif students.length > 1
      puts "Now we have #{students.count} students"
    end
    name = gets.chomp
  end
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)