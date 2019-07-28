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
end
