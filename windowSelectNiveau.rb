class WindowSelectNiveau< Gosu::Window

   def initialize(width, height)
    super
    @image=Gosu::Image.new("res/acceuil.png")
    self.caption="select"
    @map=self.maps
    @font = Gosu::Font.new(self, "Arial", 36)
    @ptr=0
   end

   def update
     retour if Gosu::button_down?(Gosu::KB_BACKSPACE)
     deplacementHaut if Gosu::button_down?(Gosu::KbUp)
     deplacementBas if Gosu::button_down?(Gosu::KbDown)
     lancerParti if Gosu::button_down?(Gosu::KB_RETURN)
     close if Gosu::button_down?(Gosu::KbEscape)
   end

   def maps()
     map=Array.new()
     Dir.foreach("./mapsDebut") do |fichier|
         if fichier!=".." && fichier!="."
           map.push(fichier)
         end
       end
     return map
   end

   def draw()
     print(@map[0])
     @image.draw(0, 0, ZOrder::Background)
     @font.draw("Sortir : ESC", 0, 0, 0, 1, 1, 0xff_f62217)
     @font.draw("Retour : BackSpace", 0, 30, 0, 1, 1, 0xff_f62217)
     @font.draw("Choisissez notre Map : ", WindowWidth/(8),WindowHeight/12, 0, 1, 1, 0xff_000000)
        for i in 0..@map.length-1
          if i==@ptr
            @font.draw(@map[i], WindowWidth/(8),Carr::Width*(i+2), 0, 1, 1, 0xff_f62217)
          else
            @font.draw(@map[i], WindowWidth/(8), Carr::Width*(i+2), 0, 1, 1, 0xff_0000ff)
          end
        end
   end

   def deplacementBas
     @ptr= (@ptr+1) % (@map.length)
     sleep(1.0/8.0)
   end

   def deplacementHaut
     @ptr= (@ptr-1) % (@map.length)
     sleep(1.0/8.0)
   end

   def lancerParti
     wind = Window.new(WindowWidth, WindowHeight,"./mapsDebut/"+@map[@ptr])
     #wind.setMap("./mapsDebut/"+@map[@ptr])
     wind.show
     close
   end

   def retour
     wind = WindowStart.new(WindowWidth, WindowHeight)
     wind.show
     close
   end

end
