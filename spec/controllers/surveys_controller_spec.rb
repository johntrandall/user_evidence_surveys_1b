require 'rails_helper'

describe SurveysController do
  describe '#index' do
    let(:survey){FactoryBot.create(:survey)}
    let(:question){FactoryBot.create(:question, survey: survey)}
    let(:answer){FactoryBot.create(:answer, question: question)}
    it 'works' do
      survey; question; answer
      get :index

      expect(assigns[:surveys]).to be_present
      expect(response).to be_successful
    end
  end
end
