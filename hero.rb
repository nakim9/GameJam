require_relative 'personnage'
class Hero < Personnage
  attr_reader :tirs, :temps, :tempsAttente, :pv
  # constructeur
  def initialize(x, y,map)
    super(x,y,map)
    #pv du heros
    @pv = 100
    #dernier sens de déplacement
    @tirs=[]
    @tempsAttente = 50
    @temps = 0
  end

  def draw
    super
    @tirs.each(&:update)
    @tirs.reject! {|tir| tir.x > WindowWidth || tir.x < 10}
  end

  # vitesse en y diminue (équivaut à un déplacement vers le haut)
  def go_up
    if contactBas
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
      #@x %= WindowSize::Width
      @y += @velocityY
      @y %= NbCarre::Height*Carr::Height
      @velocityX *= 0.96
      if   @velocityY<-1
        @velocityY *=0.90
      else
        @velocityY=(@velocityY-4)*0.8+6
      end
    end
  end
  #methodes
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


def ciel
     if contactHaut
          go_down
     end
end
end
