require 'test_helper'

class GuessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "correct guess returns true if correct" do 
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
    g1 = Guess.create(complaint: c2, user: u1,guess:u2.id,round:r)
    assert g1.correct_guess? , "false negative on correct guess"
  end
  test "correct guess returns false if incorrect" do 
    u1 = users(:one)
    u2 = users(:two)
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
    g1 = Guess.create(complaint: c2, user: u1,guess:u1.id,round:r)
    assert_not g1.correct_guess? , "false positive on incorrect guess"
  end
  test "score applying" do 
    u1 = users(:one)
    u2 = users(:two)
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
    g1 = Guess.create(complaint: c2, user: u1,guess:u2.id,round:r)
    g1.apply_score
    assert_equal 1,u1.score, "Score not applying"
  end
end
