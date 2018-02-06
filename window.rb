class Window < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Mon jeu"
    @map=Map.new("test")
    @hero = Hero.new(width/2, height/2,@map)
    #ennemis
    @ennemis = []
    @ennemis.push(Ennemi.new(width/5, height/2))
    #initilisation de la map

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

    @hero.tirs.each(&:update)

    @ennemis.each(&:update)

    @ennemis.each do |ennemi|
      ennemi.position(@map.list)
      ennemi.tjVivant(@hero.tirs)
      @hero.enContact(ennemi)
    end

    # fermer la fenêtre si la touche pressée est Echap
    close if Gosu::button_down?(Gosu::KbEscape)
  end

  def draw
    #@background_image.draw(0, 0, ZOrder::Background)
    @map.draw
    @hero.draw
    @ennemis.each(&:draw)
    @hero.tirs.each(&:draw)
  end

end
