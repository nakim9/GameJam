class Window < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Mon jeu"
    @map=Map.new()
    @hero = Hero.new(width/2, height/2,@map)
    #ennemis
    @ennemis = []
    @ennemis.push(Ennemi.new(width/5, height/2))
    #initilisation de la map
    @map.add(0,4,Carre.new(1))
    @map.add(1,4,Carre.new(1))
    @map.add(2,4,Carre.new(1))
    @map.add(3,4,Carre.new(1))
    @map.add(4,4,Carre.new(1))
    @map.add(5,4,Carre.new(1))
    @map.add(6,4,Carre.new(1))
    @map.add(7,4,Carre.new(1))
    @map.add(8,4,Carre.new(1))
    @map.add(9,4,Carre.new(1))
    @map.add(9,3,Carre.new(0,true))
    @map.add(5,3,Carre.new(1))
    @map.add(11,4,Carre.new(1))
    @map.add(12,4,Carre.new(1))
    @map.add(0,2,Carre.new(1))
    @map.add(1,2,Carre.new(1))
    #font pour les pvs
    @font = Gosu::Font.new(self, "Arial", 36)
    @camera_x = camera_y = 0
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
    @hero.position()
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
      ennemi.position(@map.list)
      ennemi.tjVivant(@hero.tirs)
      @hero.enContact(ennemi)
    end

    @camera_x = [[@hero.x - WindowSize::Width / 2, 0].max, @map.width * Carr::Width - WindowSize::Width].min
    @camera_y = [[@hero.y - WindowSize::Height / 2, 0].max, 15 * NbCarre::Height - @hero.y - WindowSize::Height].min

    # fermer la fenêtre si la touche pressée est Echap
    close if Gosu::button_down?(Gosu::KbEscape)
  end

  def draw
    #@background_image.draw(0, 0, ZOrder::Background)
    @map.draw
    @hero.draw
    @ennemis.each(&:draw)
    @hero.tirs.each(&:draw)
    #pour afficher une info en haut de la fenetre (pv, gagner, perdu,...)
    if @hero.pv>0
      @font.draw("Mes PV :"+@hero.pv.to_s, 0, 0, 0, 1, 1, 0xff_0000ff)
    else
      @font.draw("Perdu!!", 0, 0, 0, 1, 1, 0xff_0000ff)
    end

  end

end
