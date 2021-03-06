class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  def index
    @students = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @students }
    end
  end

  def account_warning
    @student = Student.find(params[:id])
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    if @student.save
      sign_in @student
      flash[:success] = "Welcome to Cliqin!"
      redirect_to @student

      return
    else
      render 'new'
      return
    end

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, :notice => 'Student was successfully created.' }
        format.json { render :json => @student, :status => :created, :location => @student }
      else
        format.html { render :action => "new" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, :notice => 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])

    student_in_courses = StudentInCourse.where(:student_ID => @student.id)

    student_in_courses.each do |sic|
      grades = Grade.where(:student_ID => sic.student_ID, :course_ID => sic.course_ID)
      grades.each do |g|
        g.destroy
      end

      sic.destroy
    end

    @student.destroy

    redirect_to root_url
    # respond_to do |format|
    #   format.html { redirect_to students_url }
    #   format.json { head :no_content }
    # end
  end
end
