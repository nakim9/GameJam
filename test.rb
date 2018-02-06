class Test  < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Mon jeu"
    @map=Map.new()
    @map.lectureMap("test")
  end

  def draw
    #@background_image.draw(0, 0, ZOrder::Background)
    @map.draw
  end

end
