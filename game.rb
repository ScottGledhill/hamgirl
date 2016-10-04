require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 1200, 800
    self.caption = "HAMGIRL"
    @background_image = Gosu::Image.new("media/space.jpg", :tileable => true)
  end

  def update
  end

  def draw
    @background_image.draw(0, 0, 0)
  end
end

window = GameWindow.new
window.show
