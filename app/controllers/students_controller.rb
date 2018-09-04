class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def create
  end

  def register
    @student = Student.find(params[:id])
  end

  def assign
    puts "---------------------",params.inspect
    course_name = params[:course]
    student_id = params[:id]
    course = Course.select(name: "#{course_name}")
    puts "--------#{course.id}"
    puts "--------#{student_id}"
    stdcourse = StudentCourse.create(course_id: course.id, student_id: student_id)
    binding.pry
    # puts "--------working"
    # stdcourse.student_id = student_id
    # puts "--------working-1"
    # stdcourse.course_id = course_id
    # puts "--------working-2"
    if(stdcourse.save)
      puts "-----saved"
    else
      puts "--------again"
      render "register"
    end
  end

  private
   def register_params
    params.require(:student_course).permit(:student_id,:course_id)
  end

end
