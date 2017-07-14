class AnswersController < ApplicationController

  # render json: params

  before_action :authenticate_user!
  def create
    @question = Question.find params[:question_id]
    # answer_params = params.require(:answer).permit(:body)
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user
    # ð shortcut for doing ð
    # answer = Answer.new(answer_params)
    # answer.question = question
    # render json: params

    if @answer.save
      # redirect_to question_path(id: @question.id)
      # redirect_to question_path(@question.id)
      redirect_to question_path(@question)
    else
      # We can use render to display any template by providing their
     # beginning from the `views/` folder.

      @answers = @question.answers.order(created_at: :desc)
      render 'questions/show'
    end
  end

  def destroy
    answer = Answer.find params[:id]
    if can?(:destroy, answer)
      answer.destroy

    redirect_to question_path(answer.question)
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end

end
