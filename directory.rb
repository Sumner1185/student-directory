def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.capitalize.chomp
  while !name.empty?
    cohort = input_cohort
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end
def input_cohort
  cohorts = [:January, :February, :March, :April, :May, :June, 
  :July, :August, :September, :October, :November, :December]
  puts "Please add the students cohort"
    cohort = gets.capitalize.chomp.to_sym
    unless cohorts.include?(cohort)
        puts "Type error"
        cohort = input_cohort
    end
    cohort
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