# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
product1 = Product.new(name:  '22K Gold Toilet Paper, 25 sheets', price_cents: '120000');
product1.save
product2 = Product.new(name:  '22K Gold Toilet Paper, 10 sheets', price_cents: '700000');
product2.save