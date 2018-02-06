class Window < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Mon jeu"
    @hero = Hero.new(width/2, height/2)
    @map=Map.new()
    @map.add(0,4,Carre.new(1))
    @map.add(1,4,Carre.new(1))
    @map.add(2,4,Carre.new(1))
    @map.add(0,2,Carre.new(1))
    @map.add(1,2,Carre.new(1))
  end

  # fonction appelée 60 fois par seconde
  def update
    # FAIRE fonction SI indiceTouchePressée EST touche
    @hero.go_left if Gosu::button_down?(Gosu::KbLeft)
    @hero.go_right if Gosu::button_down?(Gosu::KbRight)
    @hero.go_up if Gosu::button_down?(Gosu::KbUp)
    #@hero.go_down if Gosu::button_down?(Gosu::KbDown)
    # la fonction move est appelée dans tous les cas
    @hero.move
    @hero.position(@map.list)
    # fermer la fenêtre si la touche pressée est Echap
    close if Gosu::button_down?(Gosu::KbEscape)
  end

  def draw
    #@background_image.draw(0, 0, ZOrder::Background)
    @map.draw
    @hero.draw
  end

end
