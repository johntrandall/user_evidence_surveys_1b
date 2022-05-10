class SurveysController < ApplicationController
  def index
    @surveys = Survey
                 .eager_load(questions: :answers)
                 .all
  end

  def show
    @survey = Survey
                .eager_load(questions: :answers)
                .find(params[:id])
    @questions = @survey.questions
  end
end
