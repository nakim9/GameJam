require_relative 'window'
class WindowStart < Gosu::Window
  def initialize(width, height)
    super
    self.caption = "Bienvenue!"
    @font = Gosu::Font.new(self, "Arial", 36)
    @image = Gosu::Image.new("res/acceuil.png")
    @action = 'play' # ou 'edit' ou 'credit'
  end

  def update
    deplacementHaut if Gosu::button_down?(Gosu::KbUp)
    deplacementBas if Gosu::button_down?(Gosu::KbDown)

    if Gosu::button_down?(Gosu::KB_RETURN)
      if @action == 'play'
        sleep(1.0/8.0)
        wind = WindowSelectNiveau.new(WindowWidth, WindowHeight)
        wind.show
        close
      elsif @action == 'credit'
        sleep(1.0/8.0)
        wind = WindowCredit.new(WindowWidth, WindowHeight)
        wind.show
        close
      else
        sleep(1.0/8.0)
        wind = SelectMapEdit.new(WindowWidth, WindowHeight)
        wind.show
        close
      end
    end

    close if Gosu::button_down?(Gosu::KbEscape)

  end

  def draw
      @image.draw(0, 0, ZOrder::Background)
      @font.draw("Sortir : ESC", 0, 0, 0, 1, 1, 0xff_f62217)
      @font.draw("Bienvenue dans l'extraordinaire aventure des Niapocs !", WindowWidth/5, WindowHeight/5, 0, 1, 1, 0xff_000000)
      if @action == 'play'
        @font.draw("Jouer ", WindowWidth/3, WindowHeight/3, 0, 1, 1, 0xff_f62217)
        @font.draw("Créer parcours", WindowWidth/3, WindowHeight/2, 0, 1, 1, 0xff_0000ff)
        @font.draw("Crédits ", WindowWidth/3, WindowHeight/1.5, 0, 1, 1, 0xff_0000ff)
      elsif @action == 'credit'
        @font.draw("Jouer ", WindowWidth/3, WindowHeight/3, 0, 1, 1, 0xff_0000ff)
        @font.draw("Créer parcours", WindowWidth/3, WindowHeight/2, 0, 1, 1, 0xff_0000ff)
        @font.draw("Credits ", WindowWidth/3, WindowHeight/1.5, 0, 1, 1, 0xff_f62217)
      else
        @font.draw("Jouer", WindowWidth/3, WindowHeight/3, 0, 1, 1, 0xff_0000ff)
        @font.draw("Créer parcours", WindowWidth/3, WindowHeight/2, 0, 1, 1,  0xff_f62217)
        @font.draw("Crédits ", WindowWidth/3, WindowHeight/1.5, 0, 1, 1, 0xff_0000ff)

      end
  end

  def deplacementHaut
    if @action == 'edit'
      @action = 'play'
    elsif @action == 'credit'
      @action = 'edit'
    end
    sleep(1.0/6.0)
  end

  def deplacementBas
    if @action == 'play'
      @action = 'edit'
    elsif @action == 'edit'
      @action = 'credit'
    end
    sleep(1.0/6.0)
  end

end
