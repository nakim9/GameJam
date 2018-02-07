class Window < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Mon jeu"
    @map=Map.new()
    @hero = Ivrogne.new(width/2, height/2,@map)
    #ennemis
    @ennemis = []
    placeEnnemis
    #initilisation de la map
    @background_image1 = Gosu::Image.new("res/Ciel.png")
    @background_image2 = Gosu::Image.new("res/FondForet.png")
    #font pour les pvs
    @font = Gosu::Font.new(self, "Arial", 36)
    @camera_x = @camera_y = 0

    # attribut musique qui prend le fichier music.mp3 dans le répertoire res
    @song = Gosu::Song.new("res/theme principal.mp3")
    # fixe le volume à 0.25
    @song.volume = 0.25
    # lance la musique
    @song.play(true)
  end

  # fonction appelée 60 fois par seconde
  def update

    # FAIRE fonction SI indiceTouchePressée EST touche
    @hero.go_left if Gosu::button_down?(Gosu::KbLeft)
    @hero.go_right if Gosu::button_down?(Gosu::KbRight)
    @hero.go_up if Gosu::button_down?(Gosu::KbUp)
    @hero.attaque1 if Gosu::button_down?(Gosu::KB_NUMPAD_1)
    @hero.attaque2(@ennemis) if Gosu::button_down?(Gosu::KB_NUMPAD_2)
    #@hero.go_down if Gosu::button_down?(Gosu::KbDown)
    # la fonction move est appelée dans tous les cas
    @hero.move
    @hero.sol
    @hero.tirs.each do |tirs|
      tirs.kill(@ennemis)
    end
    if (@hero.temps!=0 && @hero.temps<@hero.tempsAttente)
      @hero.incremente
    elsif @hero.temps==@hero.tempsAttente
      @hero.setTemps(0)
      @hero.cri
    end
    @hero.tirs.each(&:update)

    @ennemis.each(&:update)

    @ennemis.each do |ennemi|
      ennemi.sol
      #ennemi.tjVivant(@hero.tirs)
      @hero.enContact(ennemi)
    end

    @camera_x = [@hero.x - WindowSize::Width/2, 0].max
    @camera_y = 1

    # fermer la fenêtre si la touche pressée est Echap
    close if Gosu::button_down?(Gosu::KbEscape)
  end

  def draw
    @background_image1.draw(0, 0, ZOrder::Background)
    @background_image2.draw(0, WindowSize::Height-@background_image2.height, ZOrder::Background)
    Gosu.translate(-@camera_x, -@camera_y) do
      @map.draw
      @hero.draw
      @ennemis.each(&:draw)
      @hero.tirs.each(&:draw)
      #@font.draw("hg", @hero.hg[0], @hero.hg[1], 0, 1, 1, 0xff_0000ff)
      #@font.draw("hd", @hero.hd[0], @hero.hd[1], 0, 1, 1, 0xff_0000ff)
      #@font.draw("bg", @hero.bg[0], @hero.bg[1], 0, 1, 1, 0xff_0000ff)
      #@font.draw("bd", @hero.bd[0], @hero.bd[1], 0, 1, 1, 0xff_0000ff)
    end
    #pour afficher une info en haut de la fenetre (pv, gagner, perdu,...)
    if @hero.pv>0
      @font.draw("Mes PV :"+@hero.pv.to_s, 0, 0, 0, 1, 1, 0xff_0000ff)
    else
      @font.draw("Perdu!!", 0, 0, 0, 1, 1, 0xff_0000ff)
    end
  end

  def placeEnnemis
    i=0
    @map.list.each do |x|
      j=0
      x.each do |y|
        if y && y.type==Carr::Ennemi
          point = coodonees(i,j)
          @ennemis.push(Ennemi.new(point[0], point[1],@map))
        end
      j=j+1
    end
    i=i+1
    end
  end

  def coodonees(i,j)
       point = []
       point.push(i*Carr::Width)
       point.push(j*Carr::Height)
       return point
  end

end
