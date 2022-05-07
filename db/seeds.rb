# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Survey.delete_all

Survey.create!(name: "2021 New Customer Satisfaction Survey")
Survey.create!(name: "2022 New Customer Satisfaction Survey")
Survey.create!(name: "2010 Mid Year Customer Survey")
Survey.create!(name: "2010 Mid Year Customer Survey")
