require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  test "complaints finished method returns true if number of complaints matches number of players" do 
    u1 = User.create(name:"Jacob")
    u2 = User.create(name:"Birdy")
    g =Game.create(user_count:2,max_rounds:2)
    s1 = GameSession.create(user: u1, game:g)
    s2 = GameSession.create(user: u2, game:g)
    t = Topic.create(name:"Anime")
    r = Round.create(topic: t, game: g)
    c1 = Complaint.create(complain_text:"Not realistic",user:u1, round: r)
    c2 = Complaint.create(complain_text:"Not Strange Enough",user:u2, round: r)
    assert r.complaints_finished?,"Should show all complaints are finished after each player submits"
  end
end
