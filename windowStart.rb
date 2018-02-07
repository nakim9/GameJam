require_relative 'window'
class WindowStart < Gosu::Window
  def initialize(width, height)
    super
    self.caption = "Bienvenu!"
    @font = Gosu::Font.new(self, "Arial", 36)
    @image = Gosu::Image.new("res/acceuil.png")
  end

  def update
    if Gosu::button_down?(Gosu::KbSpace)
      wind = Window.new(WindowWidth, WindowHeight)
      wind.show
      close
    elsif Gosu::button_down?(Gosu::KbUp)
      wind = Editeur.new(WindowWidth, WindowHeight)
      wind.show
      close
    end
    close if Gosu::button_down?(Gosu::KbEscape)
    close if Gosu::button_down?(Gosu::KbUp)
  end

  def draw
      @image.draw(0, 0, ZOrder::Background)

  end

end
