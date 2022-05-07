require 'rails_helper'

RSpec.describe "Surveys", type: :request do
  describe "GET /index" do
    let(:survey) { FactoryBot.create(:survey) }
    let(:question) { FactoryBot.create(:question, survey: survey) }
    let(:answer) { FactoryBot.create(:answer, question: question) }

    # This request spec isn't really needed at the moment, mostly duplicative of SurveysController spec.
    #
    # Although the Rails maintainers have spoken, the community has not yet come to a consensus
    # about controller/view coupling and the 'best' interface on which to test the VC of the rails MVC.
    # And now, with HotWire, this debate has additional nuance which has yet to shake out.
    #
    # In this example - I've added the "rails-controller-testing" gem and done things the 'old way'
    # in the controller spec. This view spec here has little value and arguably shouldn't exist. I leave it here only
    # as a rough edge and a scaffolding for future view specs.
    #
    # see https://github.com/rails/rails/issues/18950
    # see https://github.com/rails/rails-controller-testing

    it 'renders' do
      survey; question; answer
      get "/"
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end
end
