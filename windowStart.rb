require_relative 'window'
class WindowStart < Gosu::Window
  def initialize(width, height)
    super
    self.caption = "Bienvenu!"
    @font = Gosu::Font.new(self, "Arial", 36)
    @image = Gosu::Image.new("res/acceuil.png")
    @action = 'play' # ou 'edit'
  end

  def update
    deplacementHaut if Gosu::button_down?(Gosu::KbUp)
    deplacementBas if Gosu::button_down?(Gosu::KbDown)

    if Gosu::button_down?(Gosu::KB_RETURN)
      if @action == 'play'
        wind = Window.new(WindowWidth, WindowHeight)
        wind.show
        close
      else
        wind = Editeur.new(WindowWidth, WindowHeight)
        wind.show
        close
      end
    end

    close if Gosu::button_down?(Gosu::KbEscape)

  end

  def draw
      @image.draw(0, 0, ZOrder::Background)
      @font.draw("Bienvenu dans l'extraordinaire aventure des Niampocs !", WindowWidth/5, WindowHeight/5, 0, 1, 1, 0xff_000000)
      if @action == 'play'
        @font.draw("Play ", WindowWidth/3, WindowHeight/3, 0, 1, 1, 0xff_f62217)
        @font.draw("Crée un parcours", WindowWidth/3, WindowHeight/2, 0, 1, 1, 0xff_0000ff)
      else
        @font.draw("Play ", WindowWidth/3, WindowHeight/3, 0, 1, 1, 0xff_0000ff)
        @font.draw("Crée un parcours", WindowWidth/3, WindowHeight/2, 0, 1, 1,  0xff_f62217)
      end
      @font.draw("Appuyez sur espace pour valider votre choix", WindowWidth/5, WindowHeight/1.5, 0, 1, 1, 0xff_000000)
  end

  def deplacementHaut
    if @action == 'edit'
      @action = 'play'
    end
  end

  def deplacementBas
    if @action == 'play'
      @action = 'edit'
    end
  end

end
