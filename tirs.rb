class Tirs
  attr_reader :x, :y
  def initialize(x, y, sens ,image, degat = 10)
    @velocity = Gosu::random(20, 30.3)
    @image = Gosu::Image.new(image)
    @x = x
    @y = y
    @sens = sens
    @degat = degat
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
        #mettre une constante pour le nb de points de dammage
        ennemi.subir(@degat)
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
