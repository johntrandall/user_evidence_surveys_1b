require "rails_helper"

RSpec.describe "Survey Show", :type => :system do

  let(:survey) { FactoryBot.create(:survey) }
  let(:question) { FactoryBot.create(:question, survey: survey) }
  let(:answer) { FactoryBot.create(:answer, question: question) }

  describe "survey#show show/hide behavior" do
    it 'shows and hides' do
      survey; question; answer

      visit "/surveys/#{survey.id}"

      expect(page).to have_css("tr.spec-question-#{question.id}")
      expect(page).not_to have_css("tr.spec-question-#{question.id}-answer")
      expect(page).to have_content("Show Responses")
      expect(page).not_to have_content("Hide Responses")

      find('a', text: "Show Responses").click

      expect(page).to have_css("tr.spec-question-#{question.id}")
      expect(page).to have_css("tr.spec-question-#{question.id}-answer")
      expect(page).not_to have_content("Show Responses")
      expect(page).to have_content("Hide Responses")

      find('a', text: "Hide Responses").click

      expect(page).to have_css("tr.spec-question-#{question.id}")
      expect(page).not_to have_css("tr.spec-question-#{question.id}-answer")
      expect(page).to have_content("Show Responses")
      expect(page).not_to have_content("Hide Responses")

    end
  end
end
