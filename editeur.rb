
class Editeur < Gosu::Window

  def initialize(width, height,nomMap,taille)
    super(width, height)
    @taille=taille
    @nom=nomMap
    self.caption = "Editeur"
    @map=Map.new()
    @ptr=Pointeur.new(0,0,@map)
    self.ouvrir()
    @camera_x = @camera_y = 0
    @font = Gosu::Font.new(self, "Arial", 20)
    @background_image1 = Gosu::Image.new("res/Ciel.png")
    @ptrImage=0
    @background_image2List = Array.new()
    @background_image2List.push(Gosu::Image.new("res/FondForet.png"))
    @background_image2List.push(Gosu::Image.new("res/Bateau.png"))
    @background_image2List.push(Gosu::Image.new("res/Eau.png"))
    @background_image2List.push(Gosu::Image.new("res/Enfer.png"))
    @background_image2List.push(Gosu::Image.new("res/Taverne.png"))
    end

    def update
      retour if Gosu::button_down?(Gosu::KB_BACKSPACE)
      self.ouvrir if Gosu::button_down?(Gosu::KB_F9)
      @ptr.go_left if Gosu::button_down?(Gosu::KB_A)
      @ptr.go_right if Gosu::button_down?(Gosu::KB_D)
      @ptr.go_down if Gosu::button_down?(Gosu::KB_S)
      @ptr.go_up if Gosu::button_down?(Gosu::KB_W)
      @ptr.switchCarree if Gosu::button_down?(Gosu::KB_Q)
      @ptr.switchCarrea if Gosu::button_down?(Gosu::KB_E)
      @ptr.add if Gosu::button_down?(Gosu::KB_SPACE)
      @ptr.efface if  Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
      @map.creationFil(@nom) if Gosu::button_down?(Gosu::KB_F5)
      scipFond1 if Gosu::button_down?(Gosu::KB_R)
      scipFond2 if Gosu::button_down?(Gosu::KB_F)
      @camera_x = [@ptr.x*Carr::Width - WindowSize::Width/2, 0].max
      @camera_y = 1
      close if Gosu::button_down?(Gosu::KbEscape)
    end

    def scipFond1
      @ptrImage=(@ptrImage+1) % (@background_image2List.length)
      sleep(1.0/4.0)
    end

    def scipFond2
      @ptrImage=(@ptrImage-1) % (@background_image2List.length)
      sleep(1.0/4.0)
    end

    def draw
      @background_image1.draw(0, 0, ZOrder::Background)
      @background_image2List[@ptrImage].draw(0, WindowSize::Height-@background_image2List[@ptrImage].height, ZOrder::Background)
      Gosu.translate(-@camera_x, -@camera_y) do
      @map.draw
      @ptr.draw
      @font.draw("Sortir : ESC", 0, 0, 0, 1, 1, 0xff_f62217)
      @font.draw("Retour : BackSpace", 0, 30, 0, 1, 1, 0xff_f62217)
      @font.draw("Pour se déplacer utiliser les fleches (Z,Q,D,S) ", WindowWidth/4, WindowHeight/50, 3, 1, 1, 0xff_0000ff)
      @font.draw("F9 : nouveau", WindowWidth/4, (WindowHeight/50)*2, 3, 1, 1, 0xff_0000ff)
      @font.draw("A et E : Changer de carre", WindowWidth/4, (WindowHeight/50)*3, 3, 1, 1, 0xff_0000ff)
      @font.draw("Espace : ajouter", WindowWidth/4, (WindowHeight/50)*4, 3, 1, 1, 0xff_0000ff)
      @font.draw("Shift gauche : effacer", WindowWidth/4, (WindowHeight/50)*5, 3, 1, 1, 0xff_0000ff)
      @font.draw("F5 : sauvegarder", WindowWidth/4, (WindowHeight/50)*6, 3, 1, 1, 0xff_0000ff)


    end
    end

    def ouvrir()
      @map.lectureMap(@nom)
      @map.ecritConsole
      if @map == Array.new
        nouveau
      else
        @ptr.ptrClear(@map)
        @taille=@map.width
      end
      puts @taille
    end

    def nouveau
      @map.clearList(@taille)
      @ptr.ptrClear(@map)

    end


    def retour
      wind = WindowStart.new(WindowWidth, WindowHeight)
      wind.show
      close
    end
end
