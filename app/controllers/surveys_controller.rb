class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
                     .includes(questions: :answers)
  end
end
