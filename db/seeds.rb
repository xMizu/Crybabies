# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Topic.create(name: "Apples")
u1 = User.find_or_create_by(password_digest: "12345",name:"John",email:"xy@x.com")
u2 = User.find_or_create_by(password_digest: "12345",name:"Jeb Bush",email:"xyz@x.com")
u3 = User.find_or_create_by(password_digest: "12345",name:"Scoop",email:"xyzf@x.com")
u4 = User.find_or_create_by(email: "a@a.com")
g1 = Game.find_or_create_by(user_count: 3,max_rounds: 2)
gs1 = GameSession.find_or_create_by(user: u1,game: g1)
gs1 = GameSession.find_or_create_by(user: u2,game: g1)
gs1 = GameSession.find_or_create_by(user: u4,game: g1)
t1 = Topic.find_or_create_by(name: "Segway Scooters")
r1 = Round.find_or_create_by(game: g1, topic: t1)
c1 = Complaint.find_or_create_by(round: r1,user: u1,complain_text:"Far Too Masculine")
c2 = Complaint.find_or_create_by(round: r1,user: u2,complain_text:"Appropriation of Paul Blart Culture")
c3 = Complaint.find_or_create_by(round: r1,user: u4,complain_text:"What if you have no legs?")

