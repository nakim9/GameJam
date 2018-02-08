require_relative 'personnage'
class Hero < Personnage
  attr_reader :tirs, :temps, :tempsAttente
  # constructeur
  def initialize(x, y,map)

    super(x,y,map)

    #dernier sens de déplacement
    @tirs=[]
    @tempsAttente = 50
    @temps = 5
    @projectile = "res/fire.png"
    @image = Gosu::Image.new("res/hero.png")
  end

  def draw
    super
    @tirs.each(&:update)
    @tirs.reject! {|tir| tir.x > @map.width*Carr::Width || tir.x < 10}
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
  #methodes
  def attaque1
    if(@temps == 0)
      @tirs.push(Tirs.new(@x,(@y+(@image.height/2)),@dernierDeplacement, @projectile))
      @temps=1;
    end
  end

  def attaque2(ennemis)
    ennemis.each do |ennemi|
      if self.enContact(ennemi)
        ennemi.subir(25)
      end
    end
  end

  def incremente
    @temps += 1
  end

  def setTemps (temps)
    @temps = temps
  end

  def cri
  end


def ciel
     if contactHaut
          go_down
     end
end

def localiser
  point = []
  i = 0
  j = 0
  @map.list.each do |carres|
    j=0
    carres.each do |carre|
      if carre
        if carre.start
          point = self.coodonees(i,j)
        end
      end
      j +=1
    end
    i +=1
  end
  @x = point[0]
  @y = point[1]
end

  def passif
  end
  def passif(ennemis)
  end


def arrive?
  oui = false
  i = 0
  j = 0
  @map.list.each do |carres|
    j=0
    carres.each do |carre|
      if carre
        if self.enContactCarre(i,j) && carre.arrive
          oui=true
        end
      end
      j +=1
    end
    i +=1
  end
  return oui
end

  def contactPortail
    oui = false
    i = 0
    j = 0
    @map.list.each do |carres|
      j=0
      carres.each do |carre|
        if carre
          if self.enContactCarre(i,j) && carre.type==Carr::Portail
            oui=true
          end
        end
        j +=1
      end
      i +=1
    end
    return oui
  end
  
  def positionner(x,y)
    @x = x
    @y = y
  end
end
