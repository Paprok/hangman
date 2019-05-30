require_relative 'game'

view = View.new
hint_at = 1
lives = 6
game_data = GameData.new(lives, hint_at)
game = Game.new(view, game_data)
game.run
