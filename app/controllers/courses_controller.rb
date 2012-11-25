class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @courses }
    end
  end

  def roster #pass in course_ID
    @course = Course.find(params[:id])
    @answers = Answer.where(:course_ID => @course.id)
    @student_in_courses = StudentInCourse.where(:course_ID => @course.id)

  end

  def show_all
    @courses = Course.where(:instructor_ID => params[:instructor_ID])
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new(instructor_ID: params[:instructor_ID])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])

    @course.update_attributes(:active => true)
    @course.save

    redirect_to course_path(:id => @course.id)
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])


    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, :notice => 'Course was successfully created.' }
        format.json { render :json => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.json { render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, :notice => 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
      
    students = StudentInCourse.where(:course_ID => @course.id)

    students.each do |s|
     s.destroy
    end 

    @course.destroy
    redirect_to show_all_course_path(:instructor_ID => @course.instructor_ID)
  end

  def launch
    course = Course.find(params[:id])
    course.update_attribute(:active, true)
  end

end
