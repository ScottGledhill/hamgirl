require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 1200, 800
    self.caption = "Gosu Tutorial Game"
  end

  def update
  end

  def draw
  end
end

window = GameWindow.new
window.show
