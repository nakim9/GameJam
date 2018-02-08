
class WindowCredit < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Credits"
    @image = Gosu::Image.new("res/acceuil.png")
    @font1 = Gosu::Font.new(self, "Arial", 36)
    @font2 = Gosu::Font.new(self, "Arial", 26)
  end

  def update
    retour if Gosu::button_down?(Gosu::KB_BACKSPACE)
    close if Gosu::button_down?(Gosu::KbEscape)
  end

  def draw
      @image.draw(0, 0, ZOrder::Background)
      @font2.draw("Sortir : ESC", 0, 0, 0, 1, 1, 0xff_f62217)
      @font2.draw("Retour : BackSpace", 0, 30, 0, 1, 1, 0xff_f62217)

      @font1.draw("The Wednesday Team : ", WindowWidth/3, WindowHeight/10, 0, 1, 1, 0xff_000000)
      @font2.draw("Morgane Henrion : Game Designer" , WindowWidth/4, (WindowHeight/10)*2, 0, 1, 1, 0xff_000000)
      @font2.draw("Romain Lorentz:  Game Designer" , WindowWidth/4, (WindowHeight/10)*3, 0, 1, 1, 0xff_000000)
      @font2.draw("Léa Louesdon :  Game Developpeur" , WindowWidth/4, (WindowHeight/10)*4, 0, 1, 1, 0xff_000000)
      @font2.draw("Etienne Pestre :  Game Developpeur" , WindowWidth/4, (WindowHeight/10)*5, 0, 1, 1, 0xff_000000)
      @font2.draw("Tangui Robin :  Game Developpeur" , WindowWidth/4, (WindowHeight/10)*6, 0, 1, 1, 0xff_000000)
      @font1.draw("Merci !" , WindowWidth/2, (WindowHeight/10)*8, 0, 1, 1, 0xff_000000)


  end
  def retour
    wind = WindowStart.new(WindowWidth, WindowHeight)
    wind.show
    close
  end

end
