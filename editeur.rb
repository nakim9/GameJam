
class Editeur < Gosu::Window

  def initialize(width, height,nomMap)
    super(width, height)
    @nom=nomMap
    self.caption = "Editeur"
    @map=Map.new()
    self.ouvrir(@nom)
    @ptr=Pointeur.new(0,0,@map)
    @camera_x = @camera_y = 0
    @font = Gosu::Font.new(self, "Arial", 20)
    end

    def update
      retour if Gosu::button_down?(Gosu::KB_BACKSPACE)
      self.nouveau if Gosu::button_down?(Gosu::KB_F9)
      @ptr.go_left if Gosu::button_down?(Gosu::KB_A)
      @ptr.go_right if Gosu::button_down?(Gosu::KB_D)
      @ptr.go_down if Gosu::button_down?(Gosu::KB_S)
      @ptr.go_up if Gosu::button_down?(Gosu::KB_W)
      @ptr.switchCarrea if Gosu::button_down?(Gosu::KB_Q)
      @ptr.switchCarrea if Gosu::button_down?(Gosu::KB_E)
      @ptr.add if Gosu::button_down?(Gosu::KB_SPACE)
      @ptr.efface if  Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
      @map.creationFil(@nom) if Gosu::button_down?(Gosu::KB_F5)
      @camera_x = [@ptr.x*Carr::Width - WindowSize::Width/2, 0].max
      @camera_y = 1
      close if Gosu::button_down?(Gosu::KbEscape)
    end

    def draw
      Gosu.translate(-@camera_x, -@camera_y) do
      @map.draw
      @ptr.draw
      @font.draw("Sortir : ESC", 0, 0, 0, 1, 1, 0xff_f62217)
      @font.draw("Retour : BackSpace", 0, 30, 0, 1, 1, 0xff_f62217)
      @font.draw("Pour se déplacer utiliser les fleches (Haut,Droit,Gauche,Bas) ", WindowWidth/4, WindowHeight/50, 3, 1, 1, 0xff_0000ff)
      @font.draw("F9 : nouveau", WindowWidth/4, (WindowHeight/50)*2, 3, 1, 1, 0xff_0000ff)
      @font.draw("Tab : Changer de carre", WindowWidth/4, (WindowHeight/50)*3, 3, 1, 1, 0xff_0000ff)
      @font.draw("Ctrl gauche : ajouter", WindowWidth/4, (WindowHeight/50)*4, 3, 1, 1, 0xff_0000ff)
      @font.draw("Shift gauche : effacer", WindowWidth/4, (WindowHeight/50)*5, 3, 1, 1, 0xff_0000ff)
      @font.draw("F5 : sauvegarder", WindowWidth/4, (WindowHeight/50)*6, 3, 1, 1, 0xff_0000ff)


    end
    end

    def ouvrir(nomMap)
      @map.lectureMap(nomMap)
    end

    def nouveau
      @map.clearList(200)
      @ptr.ptrClear(@map)
    end

    def retour
      wind = WindowStart.new(WindowWidth, WindowHeight)
      wind.show
      close
    end
end
