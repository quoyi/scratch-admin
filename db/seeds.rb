# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Setting.keys.each { |key| Setting.create_with(value: Setting.send(key), preset: true).find_or_create_by(var: key) }

User.create_with(password: '123abc..').find_or_create_by(email: 'admin@example.com')
User.create_with(password: '123abc..').find_or_create_by(email: 'guest@example.com')
