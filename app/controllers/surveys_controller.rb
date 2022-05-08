class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
                     .eager_load(questions: :answers)
  end

  def show
    @survey = Survey.eager_load(questions: :answers).find(params[:id])
    @questions = @survey.questions
  end
end
