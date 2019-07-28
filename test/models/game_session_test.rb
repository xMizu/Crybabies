require 'test_helper'

class GameSessionTest < ActiveSupport::TestCase
  test "not creating without game or user" do 
    game = Game.create(user_count: 2,max_rounds: 5)
    game_session = GameSession.new(game: game)
    assert_not game_session.save, "Saved without user"
  end
  test "Able to Create a Game Session" do 
    game = Game.create(user_count: 2,max_rounds: 5)
    u1 = User.create(name:"bob")
    game_session = GameSession.new(game: game,user: u1)
    assert game_session.save, "Saved without user"
    assert_equal 0,game_session.score, "Game score is not initializing at 0"
  end
end
