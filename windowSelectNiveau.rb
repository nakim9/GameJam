class WindowSelectNiveau< Gosu::Window

   def initialize(width, height)
    super
    @image=Gosu::Image.new("res/acceuil.png")
    self.caption="select"
    self.maps
    @font = Gosu::Font.new(self, "Arial", 36)
    @ptrx=0
    @ptry=0
   end

   def update
     retour if Gosu::button_down?(Gosu::KB_BACKSPACE)
     deplacementHaut if Gosu::button_down?(Gosu::KbUp)
     deplacementBas if Gosu::button_down?(Gosu::KbDown)
     deplacementGauche if Gosu::button_down?(Gosu::KbLeft)
     deplacementDroit if Gosu::button_down?(Gosu::KbRight)
     lancerParti if Gosu::button_down?(Gosu::KB_RETURN)
     close if Gosu::button_down?(Gosu::KbEscape)
   end
=begin
   def maps()
     map=Array.new()
     Dir.foreach("./mapsDebut") do |fichier|
         if fichier!=".." && fichier!="."
           map.push(fichier)
         end
       end
     return map
   end
=end

def maps()
  @map=Array.new()
  @map.push(Array.new())
  x=0
  y=0
  Dir.foreach("./mapsDebut") do |fichier|
      if fichier!=".." && fichier!="."
        @map[x].push(fichier)
      y+=1
      if y==7
        y=0
        x+=1
        @map.push(Array.new())
    end
  end
    end
  end



   def draw()
     @image.draw(0, 0, ZOrder::Background)
     @font.draw("Sortir : ESC", 0, 0, 0, 1, 1, 0xff_f62217)
     @font.draw("Retour : BackSpace", 0, 30, 0, 1, 1, 0xff_f62217)
     @font.draw("Choisissez notre Map : ", WindowWidth/(8),WindowHeight/12, 0, 1, 1, 0xff_000000)
     i=0
     @map.each do |x|
       j=0
       x.each do |y|
         if y
           if i==@ptrx && j==@ptry
             @font.draw(@map[i][j], (WindowWidth/(5))*(i+1),(WindowHeight/15)*(j+2.5), 0, 1, 1, 0xff_f62217)
           else
             @font.draw(@map[i][j], (WindowWidth/(5))*(i+1), (WindowHeight/15)*(j+2.5), 0, 1, 1, 0xff_0000ff)
           end
         end
       j=j+1
     end
     i=i+1
     end
   end
=begin
for i in 0..@map.length-1
  if i==@ptr
    @font.draw(@map[i], WindowWidth/(8),Carr::Width*(i+2), 0, 1, 1, 0xff_f62217)
  else
    @font.draw(@map[i], WindowWidth/(8), Carr::Width*(i+2), 0, 1, 1, 0xff_0000ff)
  end
end
=end

  def deplacementGauche
    @ptrx-=1
    if @ptrx==-1
      @ptrx=@map.length-1
    end
    sleep(1.0/8.0)
  end

  def deplacementDroit
    @ptrx+=1
    if @ptrx==@map.length
      @ptrx=0
    end
    sleep(1.0/8.0)
  end

   def deplacementBas
     @ptry= @ptry+1
     if @ptry==@map[@ptrx].length || @map[@ptrx][@ptry]=="sansnom"
       @ptry=0
       if @ptrx==@map.length-1
         @ptrx=0
       else
         @ptrx=@ptrx+1
       end
     end
     sleep(1.0/8.0)
   end

   def deplacementHaut
     @ptry= @ptry-1
   if @ptry==-1
     if @ptrx==0
       @ptrx=@map.length-1
       @ptry=@map[@ptrx].length-1
     else
       @ptrx=@ptrx-1
       @ptry=@map[@ptrx].length-1
     end
   end
     sleep(1.0/8.0)
   end

   def lancerParti
     wind = Window.new(WindowWidth, WindowHeight,"./mapsDebut/"+@map[@ptrx][@ptry])
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
