class Course < ApplicationRecord
  has_many :student_courses
  has_many :teacher_courses
end
