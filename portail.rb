class Portail
  def initialize(x,y,map)
    @map = map
    #dernier sens de déplacement

    @image = Gosu::Image.new("res/cube/Portail.png")
    @x=x
    @y=y - @image.height

  end

  def draw
    @image.draw(@x, @y, 3, 1, 1)
  end

  def enContact(item)
    oui = false
    distance = Gosu::distance(@x,@y,item.x, item.y)
    if distance<150
      oui = true
    end
    return oui
  end
end
