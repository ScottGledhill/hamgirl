require 'gosu'
require_relative 'lib/player'
require_relative 'lib/hams'

module ZOrder
  Background, Hams, Player, UI = *0..3
end

class GameWindow < Gosu::Window
  def initialize
    super 1200, 800
    self.caption = "HAMGIRL"
    @background_image = Gosu::Image.new("media/space.jpg", :tileable => true)
    @player = Player.new
    @player.warp(320, 240)
    @ham_anim = Gosu::Image::load_tiles("media/ham.jpg", 25, 25)
    @hams = Array.new
  end

  def update
    if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
      @player.turn_left
    end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
      @player.turn_right
    end
    if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpButton0 then
      @player.accelerate
    end

    @player.move
    @player.collect_ham(@hams)

    if rand(100) < 4 and @hams.size < 25 then
      @hams.push(Ham.new(@ham_anim))
    end
  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @player.draw
    @hams.each { |ham| ham.draw }
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

window = GameWindow.new
window.show
