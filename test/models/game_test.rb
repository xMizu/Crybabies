require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "in progress method should return false if no round are associated" do
    g = Game.create(user_count: 2, max_rounds:2)
    assert_not g.in_progress?, "Game is showing as in progress"
  end
  test "in progress method will return true if there are rounds associated." do
    g = Game.create(user_count: 2, max_rounds:2)
    t = Topic.create(name: "Public Restrooms")
    r = Round.create(game: g, topic: t)
    assert_not g.in_progress?, "Game is showing as in progress"
  end
  test "Finished not true test" do 
    u1 = User.create(name:"Jacob")
    u2 = User.create(name:"Birdy")
    u3 = User.create(name:"Jeb")
    g =Game.create(user_count:3,max_rounds:2)
    s1 = GameSession.create(user: u1, game:g)
    s2 = GameSession.create(user: u2, game:g)
    s3 = GameSession.create(user: u2, game:g)
    t = Topic.create(name:"Anime")
    r = Round.create(topic: t, game: g)
    c1 = Complaint.create(complain_text:"Not realistic",user:u1, round: r)
    c2 = Complaint.create(complain_text:"Not Strange Enough",user:u2, round: r)
    c3 = Complaint.create(complain_text:"I can't read",user:u3, round: r)
    g1 = Guess.create(complaint: c2, user: u1,guess:u3.id,round:r)
    g2 = Guess.create(complaint: c3, user: u1,guess:u2.id,round:r)
    g3 = Guess.create(complaint: c3, user: u2,guess:u3.id,round:r)
    g4 = Guess.create(complaint: c1, user: u2,guess:u1.id,round:r)
    g5 = Guess.create(complaint: c1, user: u3,guess:u2.id,round:r)
    g6 = Guess.create(complaint: c2, user: u3,guess:u2.id,round:r)
    assert_not g.finished?, "Showing incorrectly as finished."
  end
  test "Finished is true test" do 
    u1 = User.create(name:"Jacob")
    u2 = User.create(name:"Birdy")
    u3 = User.create(name:"Jeb")
    g =Game.create(user_count:3,max_rounds:1)
    s1 = GameSession.create(user: u1, game:g)
    s2 = GameSession.create(user: u2, game:g)
    s3 = GameSession.create(user: u2, game:g)
    t = Topic.create(name:"Anime")
    r = Round.create(topic: t, game: g)
    c1 = Complaint.create(complain_text:"Not realistic",user:u1, round: r)
    c2 = Complaint.create(complain_text:"Not Strange Enough",user:u2, round: r)
    c3 = Complaint.create(complain_text:"I can't read",user:u3, round: r)
    g1 = Guess.create(complaint: c2, user: u1,guess:u3.id,round:r)
    g2 = Guess.create(complaint: c3, user: u1,guess:u2.id,round:r)
    g3 = Guess.create(complaint: c3, user: u2,guess:u3.id,round:r)
    g4 = Guess.create(complaint: c1, user: u2,guess:u1.id,round:r)
    g5 = Guess.create(complaint: c1, user: u3,guess:u2.id,round:r)
    g6 = Guess.create(complaint: c2, user: u3,guess:u2.id,round:r)
    assert g.finished?, "Showing incorrectly as not finished."
  end

end
