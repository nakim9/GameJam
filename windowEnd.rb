require_relative 'window'
class WindowEnd < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Perdu!"
    @font = Gosu::Font.new(self, "Arial", 36)
    #@image = Gosu::Image.new("res/acceuil.png")
    @points = 0
  end

  def update
    if Gosu::button_down?(Gosu::KbSpace)
      wind = Window.new(WindowWidth, WindowHeight)
      wind.show
      close
    end
    close if Gosu::button_down?(Gosu::KbEscape)
  end

  def setPoints (points)
    @points = points
  end

  def draw
      #@image.draw(0, 0, ZOrder::Background)
      @font.draw("Perdu ! ", WindowWidth/3, WindowHeight/5, 0, 1, 1, 0xff_0000ff)
      @font.draw("Mes Points : " + @points.to_s, WindowWidth/3, WindowHeight/4, 0, 1, 1, 0xff_0000ff)
      @font.draw("Pour retenter l'aventure taper sur la bar d'espace ;)", WindowWidth/3, WindowHeight/3, 0, 1, 1, 0xff_0000ff)
      #@font.draw("bd", @hero.bd[0], @hero.bd[1], 0, 1, 1, 0xff_0000ff)
  end

end
