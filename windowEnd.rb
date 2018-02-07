require_relative 'WindowStart'

class WindowEnd < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Fini!!"
    @image = Gosu::Image.new("res/acceuil.png")
    @font = Gosu::Font.new(self, "Arial", 36)
    #@image = Gosu::Image.new("res/acceuil.png")
    @points = 0
    @cas=1
  end

  def update
    if Gosu::button_down?(Gosu::KbSpace)
      wind = Window.new(WindowWidth,WindowHeight)
      wind.show
      close
    end
    close if Gosu::button_down?(Gosu::KbEscape)
  end
  def cas(cas)
    @cas = cas
  end
  def setPoints (points)
    @points = points
  end

  def draw
      @image.draw(0, 0, ZOrder::Background)
      if (@cas==1)
        @font.draw("Perdu ! ", WindowWidth/5, WindowHeight/5, 0, 1, 1, 0xff_0000ff)
        @font.draw("Vous avez essayer de réussir en " + @points.to_s+" unitées de temps niapocs !", WindowWidth/5, WindowHeight/4, 0, 1, 1, 0xff_0000ff)
      elsif (@cas==2)
        @font.draw("Bravo ! ", WindowWidth/5, WindowHeight/5, 0, 1, 1, 0xff_0000ff)
        @font.draw("Vous avez réussi en " + @points.to_s+" unitées de temps niapocs !", WindowWidth/5, WindowHeight/4, 0, 1, 1, 0xff_0000ff)
      end

      @font.draw("Pour retenter l'aventure taper sur la bar de l'espace ;)", WindowWidth/5, WindowHeight/3, 0, 1, 1, 0xff_0000ff)
      #@font.draw("bd", @hero.bd[0], @hero.bd[1], 0, 1, 1, 0xff_0000ff)
  end

end
