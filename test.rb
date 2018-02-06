class Test  < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Mon jeu"
    @map=Map.new()
    @hero = Hero.new(0, 0,@map)
  end

  def draw
    #@background_image.draw(0, 0, ZOrder::Background)
    @map.draw
    @hero.draw
  end

end
