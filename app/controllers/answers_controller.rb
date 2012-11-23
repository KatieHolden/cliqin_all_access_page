class AnswersController < ApplicationController
  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @answers }
    end
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer = Answer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @answer }
    end
  end

  # GET /answers/new
  # GET /answers/new.json
  def new
    @answer = Answer.new(course_ID: params[:course_ID])
    
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @answer }
    end
  end

  def set
    @answer = Answer.find(params[:id])
    
  end

  def change
    @answer = Answer.find(params[:id])
    i = 0
    temp_ans = ""

    # @answer.total_points.times do |i|
    #   temp_ans += params[i.to_s]
    # end


    while i.to_s < @answer.total_points.to_s
       temp_ans += params[i.to_s]
       i += 1 
    end
    @answer.answers = temp_ans
    @answer.save
    redirect_to course_path(:id => @answer.course_ID)
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(params[:answer])
    @answer.save
    redirect_to set_answer_path(@answer)
    return
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, :notice => 'Answer was successfully created.' }
        format.json { render :json => @answer, :status => :created, :location => @answer }
      else
        format.html { render :action => "new" }
        format.json { render :json => @answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /answers/1
  # PUT /answers/1.json
  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to @answer, :notice => 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end
end
