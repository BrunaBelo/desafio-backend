# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ExpenseType.create!(name: 'Nota Fiscal', number: 0)
ExpenseType.create!(name: 'Recibo', number: 1)
ExpenseType.create!(name: 'Despesa no Exterior', number: 2)
ExpenseType.create!(name: 'Outro', number: 3)
