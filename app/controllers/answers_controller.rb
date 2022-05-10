class AnswersController < ApplicationController
  def index
    @question = Question
                  .eager_load(:answers)
                  .find(params[:question_id])
    @answers= @question.answers
  end
end
