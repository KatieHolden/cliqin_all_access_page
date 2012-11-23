class GradesController < ApplicationController
  # GET /grades
  # GET /grades.json
  def index
    @grades = Grade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @grades }
    end
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
    @grade = Grade.find(params[:id])

    respond_to do |format|
       format.html # show.html.erb
       format.json { render :json => @grade }
    end

  end

  # GET /grades/new
  # GET /grades/new.json
  def new
    @grade = Grade.new(course_ID: params[:course_ID], student_ID: params[:student_ID], 
      :current_question => 1, :points => 0, :class_date => Date.today, :total_points => params[:total_points])
    
    temp_ans = []
    i = 0

    while i.to_s < params[:total_points] 
       temp_ans.push('Z')
       i += 1 
    end
    @grade.answers = temp_ans.join
    @grade.save

    redirect_to grade_path(:id => @grade.id)
    return
    
  end

  def next
    @grade = Grade.find(params[:id])
    @grade.update_attributes(:current_question => @grade.current_question + 1)

    if(@grade.current_question == @grade.total_points + 1)
      redirect_to calculate_grade_path(:id => @grade.id)
    else
      redirect_to grade_path(@grade)
    end
  end

  def calculate
    @grade = Grade.find(params[:id])

    answer = Answer.where(:course_ID => @grade.course_ID, :class_date => @grade.class_date)
    i = 0

    answer.each do |a|
      while i < a.total_points
        if @grade.answers[i] == a.answers[i]
          @grade.points += 1
          @grade.save
        end
        i += 1
      end
    end

    redirect_to grade_path(@grade)
  end

  def display
    @grade = Grade.where(:student_ID => params[:student_ID], :course_ID => params[:course_ID])

  end

  # GET /grades/1/edit
  def edit
    @grade = Grade.find(params[:id])
    logger.info @grade.inspect

    new_answers = @grade.answers.dup
    new_answers[@grade.current_question - 1] = params[:temp]
    
    @grade.update_attributes(:answers => new_answers)

    redirect_to grade_path(@grade)
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(params[:grade])

    respond_to do |format|
      if @grade.save
        format.html { redirect_to @grade, :notice => 'Grade was successfully created.' }
        format.json { render :json => @grade, :status => :created, :location => @grade }
      else
        format.html { render :action => "new" }
        format.json { render :json => @grade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /grades/1
  # PUT /grades/1.json
  def update
    @grade = Grade.find(params[:id])

    respond_to do |format|
      if @grade.update_attributes(params[:grade])
        format.html { redirect_to @grade, :notice => 'Grade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @grade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy

    respond_to do |format|
      format.html { redirect_to grades_url }
      format.json { head :no_content }
    end
  end

end
