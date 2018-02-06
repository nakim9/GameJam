class Ennemi
  attr_reader :x, :y
  # constructeur
  def initialize(x, y)
    #dernier sens de déplacement
    @dernierDeplacement = 'right'
    # coordonnées
    @x = x
    @y = y
    @radius = 10
    # vitesse (de base 0 : à l'arret)
    @velocityX = 0.0
    @velocityY = 1
    #image du personnage
    @image = Gosu::Image.new("res/hero.png")
  end

  def draw
    @image.draw(@x, @y, ZOrder::Hero)
  end

  # vitesse en x diminue (équivaut à un déplacement vers la gauche)
  def go_left
    @dernierDeplacement = 'left'
    @velocityX -= 0.1
  end

  # vitesse en x augmente (équivaut à un déplacement vers la droite)
  def go_right
    @dernierDeplacement = 'right'
    @velocityX += 0.1
  end

  #mouvement aléatoire
  def mouvement
    #puts @x
    if @x+@image.width>WindowWidth-50
      self.go_left
    elsif @x<50
      self.go_right
    elsif @dernierDeplacement == 'right'
      self.go_right
    elsif @dernierDeplacement == 'left'
      self.go_left
    end
  end
  # modification des coordonées du héros
  def move
    @x += @velocityX
    @x %= 1024
    @y += @velocityY
    @y %= 576
    @velocityX *= 0.96
    if @velocityY>1
      @velocityY *= 0.6
    end
  end

  def position(map)
    #coordonées de la case sur laquelle ce trouve notre hero
    i = (@x)/100
    j = (@y+@image.height)/100
    #case
    if map[i]
      tile = map[i][j]
      if tile
        @velocityY = 0
      else
        @velocityY = 1.5
      end
    else
      @velocityY = 1.5
    end
  end


end
