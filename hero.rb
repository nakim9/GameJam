class Hero
  attr_reader :x, :y, :tirs
  # constructeur
  def initialize(x, y,map)
    @map=map
    #dernier sens de déplacement
    @dernierDeplacement = 'rien'
    # coordonnées
    @x = x
    @y = y
    @radius = 10
    # vitesse (de base 0 : à l'arret)
    @velocityX = 0.0
    @velocityY = 1.5
    #image du personnage
    @image = Gosu::Image.new("res/hero.png")
    @tirs=[]
  end

  def draw
    @image.draw(@x, @y, ZOrder::Hero)
    @tirs.each(&:update)
    @tirs.reject! {|tir| tir.x > WindowWidth || tir.x < 10}
  end

  # vitesse en x diminue (équivaut à un déplacement vers la gauche)
  def go_left
    @dernierDeplacement = 'left'
    @velocityX -= 0.5
  end

  # vitesse en x augmente (équivaut à un déplacement vers la droite)
  def go_right
    @dernierDeplacement = 'right'
    @velocityX += 0.5
  end

  # vitesse en y diminue (équivaut à un déplacement vers le haut)
  def go_up
    if aLesPiedParterre()
    @velocityY -= 25
    move
    sleep(1.0/24.0)
  end
  end

  # vitesse en y augmente (équivaut à un déplacement vers le bas)
  def go_down
    @velocityY += 0.5
  end

  # modification des coordonées du héros
  def move
    @x += @velocityX
    @x %= 1024
    @y += @velocityY
    @y %= 576
    @velocityX *= 0.96
    if   @velocityY<-1
      @velocityY *=0.6
    else
      @velocityY=(@velocityY-4)*0.96+4
    end


  end

  def position (map)
    #coordonées de la case sur laquelle ce trouve notre hero
    i = @x/100
    j = @y/100
    #case
    tile = map[i][j]
    if tile
      @velocityY = 0
    end
  end

  def enContact(item)
    distance = Gosu::distance(@x,@y,item.x, item.y)
    if distance<35
      print "outch"
    end
  end

  def attaque
    @tirs.push(Tirs.new(@x,(@y+(@image.height/2)),@dernierDeplacement))
  end

  def aLesPiedParterre()
    i = @x/100
    j = @y/100
    return @map.list[i][j]!=nil
  end


end
