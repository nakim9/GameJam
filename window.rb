class Window < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Mon jeu"
    @map=Map.new("maps/mapGrande")


    @hero = Hero.new(width/2, height/2,@map)
    #ennemis
    @ennemis = []
    @ennemis.push(Ennemi.new(width/5, height/2,@map))
    #initilisation de la map
    #font pour les pvs
    @font = Gosu::Font.new(self, "Arial", 36)
    @camera_x = @camera_y = 0
  end

  # fonction appelée 60 fois par seconde
  def update
    # FAIRE fonction SI indiceTouchePressée EST touche
    @hero.go_left if Gosu::button_down?(Gosu::KbLeft)
    @hero.go_right if Gosu::button_down?(Gosu::KbRight)
    @hero.go_up if Gosu::button_down?(Gosu::KbUp)
    @hero.attaque if Gosu::button_down?(Gosu::KbSpace)
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
    #@background_image.draw(0, 0, ZOrder::Background)
    Gosu.translate(-@camera_x, -@camera_y) do
      @map.draw
      @hero.draw
      @ennemis.each(&:draw)
      @hero.tirs.each(&:draw)
    end
    #pour afficher une info en haut de la fenetre (pv, gagner, perdu,...)
    if @hero.pv>0
      @font.draw("Mes PV :"+@hero.pv.to_s, 0, 0, 0, 1, 1, 0xff_0000ff)
    else
      @font.draw("Perdu!!", 0, 0, 0, 1, 1, 0xff_0000ff)
    end
  end

end
