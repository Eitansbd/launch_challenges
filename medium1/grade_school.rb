# grade_school
require 'pry'
class School
  def initialize
    @grades_and_names = Hash.new([])
  end

  def add(student_name, grade)
    @grades_and_names[grade] += [student_name]
  end

  def to_h
    @grades_and_names.sort.map { |key, value| [key, value.sort] }.to_h
  end

  def grade(grade)
    @grades_and_names[grade]
  end
end
