# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create!(name: "ユーザー1", gender: :male, birthday: "1988-10-06", email: "hoge1@gmail.com", profile: "ほげほげ1")
user2 = User.create!(name: "ユーザー2", gender: :male, birthday: "1988-10-06", email: "hoge2@gmail.com", profile: "ほげほげ")
user3 = User.create!(name: "ユーザー3", gender: :male, birthday: "1988-10-06", email: "hog3@gmail.com", profile: "ほげほげ")
user4 = User.create!(name: "ユーザー4", gender: :male, birthday: "1988-10-06", email: "hog4@gmail.com", profile: "ほげほげ")
user5 = User.create!(name: "ユーザー5", gender: :male, birthday: "1988-10-06", email: "hog5@gmail.com", profile: "ほげほげ")
user6 = User.create!(name: "ユーザー6", gender: :male, birthday: "1988-10-06", email: "hog6@gmail.com", profile: "ほげほげ")


sport1 = Sport.create!(name: "Basball")
sport2 = Sport.create!(name: "basketball")
sport3 = Sport.create!(name: "soccer")
sport4 = Sport.create!(name: "tennis")
sport5 = Sport.create!(name: "running")
sport6 = Sport.create!(name: "volleyball")


place1 = Place.create!(name: "新宿")
place2 = Place.create!(name: "代々木")
place3 = Place.create!(name: "渋谷")
place4 = Place.create!(name: "恵比寿")
place5 = Place.create!(name: "目黒")
place6 = Place.create!(name: "品川")


UsersSport.create!(user_id: user1.id, sport_id: sport1.id)
UsersSport.create!(user_id: user2.id, sport_id: sport2.id)
UsersSport.create!(user_id: user3.id, sport_id: sport3.id)
UsersSport.create!(user_id: user4.id, sport_id: sport4.id)
UsersSport.create!(user_id: user5.id, sport_id: sport5.id)
UsersSport.create!(user_id: user6.id, sport_id: sport6.id)


content1 = Content.create!(scheduled_at: Time.now+1.weeks, place_id: place1.id, user_id: user1.id)
content2 = Content.create!(scheduled_at: Time.now+1.weeks, place_id: place2.id, user_id: user2.id)
content3 = Content.create!(scheduled_at: Time.now+1.weeks, place_id: place3.id, user_id: user3.id)
content4 = Content.create!(scheduled_at: Time.now+1.weeks, place_id: place4.id, user_id: user4.id)
content5 = Content.create!(scheduled_at: Time.now+1.weeks, place_id: place5.id, user_id: user5.id)
content6 = Content.create!(scheduled_at: Time.now+1.weeks, place_id: place6.id, user_id: user6.id)


Agreement.create!(user_id: user1.id, content_id: content1.id, status: 0)
Agreement.create!(user_id: user2.id, content_id: content2.id, status: 1)
Agreement.create!(user_id: user3.id, content_id: content3.id, status: 2)
Agreement.create!(user_id: user4.id, content_id: content4.id, status: 0)
Agreement.create!(user_id: user5.id, content_id: content5.id, status: 1)
Agreement.create!(user_id: user6.id, content_id: content6.id, status: 2)
