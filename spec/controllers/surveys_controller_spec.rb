require 'rails_helper'

describe SurveysController do
  let(:survey) { FactoryBot.create(:survey) }
  let(:question) { FactoryBot.create(:question, survey: survey) }
  let(:answer) { FactoryBot.create(:answer, question: question) }

  describe '#index' do
    it 'assigns, request successful' do
      survey; question; answer
      get :index

      expect(assigns[:surveys]).to be_present
      expect(response).to be_successful
    end
  end

  describe '#show' do
    it 'assigns, request successful' do
      survey; question; answer
      get :show, params: { id: survey.id }

      expect(assigns[:survey]).to be_present
      expect(response).to be_successful
    end
  end
end
