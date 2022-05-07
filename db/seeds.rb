# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Survey.destroy_all

survey_2021 = Survey.create!(name: "2021 New Customer Satisfaction Survey")
Survey.create!(name: "2022 New Customer Satisfaction Survey")
Survey.create!(name: "2010 Mid Year Customer Survey")
Survey.create!(name: "2011 Mid Year Customer Survey")

survey_2021.questions.create!(text: "Should UserEvidence hire John?")
question_2021 = survey_2021.questions.create!(text: "What other products did you  before choosing UserEvidence?")

3.times do
  question_2021.answers.create!(
    text: Cicero.paragraphs([1, 2, 3].sample),
    email: "#{Cicero.word}@#{["gmail.com", "hotmail.com", "yahoo.com"].sample}",
    name: "#{Cicero.word} #{Cicero.word}"
  )
end
