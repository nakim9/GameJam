require_relative 'WindowStart'

class WindowEnd < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Fini!!"
    @image = Gosu::Image.new("res/acceuil.png")
    @font = Gosu::Font.new(self, "Arial", 36)
    @points = 0
    @cas=1
    @joueur = nil
    @raison = nil
  end

  def update
    if @cas == 1
      self.caption = "Perdu!!"
    else
      self.caption = "Bravo!!"
    end
    if Gosu::button_down?(Gosu::KbSpace)
      wind = WindowSelectNiveau.new(WindowWidth,WindowHeight)
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

  def joueur(joueur)
    @joueur = joueur
  end

  def raison(raison)
    @raison = raison
  end

  def draw
      @image.draw(0, 0, ZOrder::Background)
      @font.draw("Sortir : ESC", 0, 0, 0, 1, 1, 0xff_f62217)
      if (@cas==1)
        @font.draw("Perdu ! ", WindowWidth/5, WindowHeight/10, 0, 1, 1, 0xff_0000ff)
        @font.draw("Vous avez essayer de réussir en " + @points.to_s+" unitées de temps niapocs !", WindowWidth/5, WindowHeight/10*2, 0, 1, 1, 0xff_0000ff)
      elsif (@cas==2)
        @font.draw("Bravo ! ", WindowWidth/5, WindowHeight/10, 0, 1, 1, 0xff_0000ff)
        @font.draw("Vous avez réussi en " + @points.to_s+" unitées de temps niapocs !", WindowWidth/5, WindowHeight/10*2, 0, 1, 1, 0xff_0000ff)
      end

      if @joueur && @raison
        @font.draw("Grace au "+@joueur, WindowWidth/5, WindowHeight/10*3, 0, 1, 1, 0xff_0000ff)
        @font.draw("La raison : " + @raison, WindowWidth/5, WindowHeight/10*4, 0, 1, 1, 0xff_0000ff)
      end
      @font.draw("Pour retenter l'aventure taper sur la bar de l'espace ;)", WindowWidth/5, WindowHeight/10*6, 0, 1, 1, 0xff_0000ff)
      #@font.draw("bd", @hero.bd[0], @hero.bd[1], 0, 1, 1, 0xff_0000ff)
  end
end
