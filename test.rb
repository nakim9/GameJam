class Test  < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Mon jeu"
    @map=Map.new()

    self.draw
  end

  def draw
    @map.draw
  end

end
