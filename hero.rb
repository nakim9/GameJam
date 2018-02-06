class Hero
  attr_reader :x, :y, :tirs, :temps, :tempsAttente, :pv
  # constructeur
  def initialize(x, y,map)
    #pv du heros
    @pv = 100
    @map=map
    #dernier sens de déplacement
    @dernierDeplacement = 'left'
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
    @tempsAttente = 50
    @temps = 0
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
    if @pv>0
      @x += @velocityX
      @x %= WindowSize::Width
      @y += @velocityY
      @y %= WindowSize::Height
      @velocityX *= 0.96
      if   @velocityY<-1
        @velocityY *=0.85
      else
        @velocityY=(@velocityY-4)*0.8+6
      end
    end



  end

  def position ()
    #coordonées de la case sur laquelle ce trouve notre hero
    i = @x/Carr::Width
    j = (@y+@image.height)/Carr::Height
    #case
    if aLesPiedParterre()
      @velocityY = 0

    end
  end

  def enContact(item)
    distance = Gosu::distance(@x,@y,item.x, item.y)
    if distance<35
      #print "outch"
      @pv -= 1
    end
  end

  def attaque
    if(@temps == 0)
      @tirs.push(Tirs.new(@x,(@y+(@image.height/2)),@dernierDeplacement))
      @temps=1;
    end
  end

  def incremente
    @temps += 1
  end

  def setTemps (temps)
    @temps = temps
  end

  def aLesPiedParterre()
    i = @x/Carr::Width
    j = (@y+@image.height)/Carr::Height
    return @map.list[i][j]!=nil
  end



end
