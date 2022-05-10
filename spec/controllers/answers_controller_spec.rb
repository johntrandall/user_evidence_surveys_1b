require 'rails_helper'

describe AnswersController do
  let(:question) { FactoryBot.create(:question) }
  let(:answer) { FactoryBot.create(:answer, question: question) }

  describe '#index' do
    it 'assigns, request successful' do
      question; answer
      get :index, params: {question_id: question.id}

      expect(response).to be_successful
    end
  end
end
