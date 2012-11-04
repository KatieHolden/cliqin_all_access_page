class StudentInCoursesController < ApplicationController
  # GET /student_in_courses
  # GET /student_in_courses.json
  def index
    @student_in_courses = StudentInCourse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_in_courses }
    end
  end

  # GET /student_in_courses/1
  # GET /student_in_courses/1.json
  def show
    @student_in_course = StudentInCourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_in_course }
    end
  end

  # GET /student_in_courses/new
  # GET /student_in_courses/new.json
  def new
    @student_in_course = StudentInCourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_in_course }
    end
  end

  # GET /student_in_courses/1/edit
  def edit
    @student_in_course = StudentInCourse.find(params[:id])
  end

  # POST /student_in_courses
  # POST /student_in_courses.json
  def create
    @student_in_course = StudentInCourse.new(params[:student_in_course])

    respond_to do |format|
      if @student_in_course.save
        format.html { redirect_to @student_in_course, notice: 'Student in course was successfully created.' }
        format.json { render json: @student_in_course, status: :created, location: @student_in_course }
      else
        format.html { render action: "new" }
        format.json { render json: @student_in_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_in_courses/1
  # PUT /student_in_courses/1.json
  def update
    @student_in_course = StudentInCourse.find(params[:id])

    respond_to do |format|
      if @student_in_course.update_attributes(params[:student_in_course])
        format.html { redirect_to @student_in_course, notice: 'Student in course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_in_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_in_courses/1
  # DELETE /student_in_courses/1.json
  def destroy
    @student_in_course = StudentInCourse.find(params[:id])
    @student_in_course.destroy

    respond_to do |format|
      format.html { redirect_to student_in_courses_url }
      format.json { head :no_content }
    end
  end
end
