class QuestionsController < ApplicationController
  def index
    @questions = Question.order(:priority)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(params[:question])

    if @question.save
      redirect_to @question, notice: 'Question has been added.' 
    else
      render action: "new"
    end
  end 

  def update
    @question = Question.find(params[:id])

    if @question.update_attributes(params[:question])
      redirect_to @question, notice: 'Question was updated'  
    else
      render action: "edit"
    end
  end 
end
