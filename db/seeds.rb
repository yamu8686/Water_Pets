# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "admin",
             email: "sample@admin",
             password: "admin1",
             password_confirmation: "admin1",
             admin: true)

Tag.create([
  { name: '熱帯魚' },
  { name: '海水魚' },
  { name: '川魚' },
  { name: '甲殻類' },
  { name: '貝類' },
  { name: '古代魚' },
  { name: '飼料用品' },
  { name: '水槽器具' }
  ])
