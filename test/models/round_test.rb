require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  test "complaint phase method returns false if number of complaints matches number of players" do 
    u1 = User.create(name:"Jacob")
    u2 = User.create(name:"Birdy")
    g =Game.create(user_count:2,max_rounds:2)
    s1 = GameSession.create(user: u1, game:g)
    s2 = GameSession.create(user: u2, game:g)
    t = Topic.create(name:"Anime")
    r = Round.create(topic: t, game: g)
    c1 = Complaint.create(complain_text:"Not realistic",user:u1, round: r)
    c2 = Complaint.create(complain_text:"Not Strange Enough",user:u2, round: r)
    assert_not r.complaint_phase?,"Should show all complaints are finished after each player submits"
  end
  test "complaint phase is showing up as true if it's less than the number of players" do 
    u1 = User.create(name:"Jacob")
    u2 = User.create(name:"Birdy")
    g =Game.create(user_count:2,max_rounds:2)
    s1 = GameSession.create(user: u1, game:g)
    s2 = GameSession.create(user: u2, game:g)
    t = Topic.create(name:"Anime")
    r = Round.create(topic: t, game: g)
    c1 = Complaint.create(complain_text:"Not realistic",user:u1, round: r)
    assert r.complaint_phase?, "complaint phase method is giving a false negative"
  end
  #TODO need to make a test that a user can only submit one complaint per round
  test "guess phase returns true if guesses are not finished" do 
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
    assert r.guess_phase?, "guess phase is giving a false negative"
  end

  test "guess phase returns false" do 
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
    assert_not r.guess_phase?, "false positive on guess phase"
  end
  test "Finished Round Test" do 
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
    assert r.finished?, "Round not showing as finished"
  end
end
