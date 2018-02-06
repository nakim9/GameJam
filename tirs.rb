class Tirs
  attr_reader :x, :y
  def initialize(x, y, sens)
    @velocity = Gosu::random(0.8, 30.3)
    @image = Gosu::Image.new("res/fire.png")
    @x = x
    @y = y
    @sens = sens
  end

  def update
    if @sens == 'right'
      @x += @velocity
    else
      @x -= @velocity
    end
  end

  def draw
    @image.draw(@x, @y, ZOrder::Hero)
  end

  def kill(ennemis)
    ennemis.each do |ennemi|
      if self.enContact(ennemi)
        puts self.enContact(ennemi)
        ennemis.delete(ennemi)
      end

    end
  end

  def enContact(item)
    distance = Gosu::distance(@x,@y,item.x, item.y)
    reponse = false
    if distance<150
      reponse = true
    end
    return reponse
  end

end
