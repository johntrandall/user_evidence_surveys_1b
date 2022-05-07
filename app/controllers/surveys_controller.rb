class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
                     .includes(questions: :answers)
  end

  def show
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
    #.(questions: :answers)
  end
end
