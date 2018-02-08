require_relative 'personnage'
class Ennemi < Personnage
  # constructeur
  def initialize(x, y,map)
    super(x,y,map)
    #image du personnage
    @depart = true
    @perso = []
    @images = []
    # on ajoute les 4 images dans le tableau -- obligatoirement 2 images
    @images.push(Gosu::Image.new("res/enemis/DragonG.png"))
    @images.push(Gosu::Image.new("res/enemis/DragonD.png"))
    @perso.push(@images)
    @images = []
    @images.push(Gosu::Image.new("res/enemis/DragonD'eauG.png"))
    @images.push(Gosu::Image.new("res/enemis/DragonD'eauD.png"))
    @perso.push(@images)
    @images = []
    @images.push(Gosu::Image.new("res/enemis/EcureilG.png"))
    @images.push(Gosu::Image.new("res/enemis/EcureilD.png"))
    @perso.push(@images)
    @images = []
    @images.push(Gosu::Image.new("res/enemis/OiseauG.png"))
    @images.push(Gosu::Image.new("res/enemis/OiseauD.png"))
    @perso.push(@images)
    @images = []
    @images.push(Gosu::Image.new("res/enemis/SqueletteG.png"))
    @images.push(Gosu::Image.new("res/enemis/SqueletteD.png"))
    @perso.push(@images)
    choixImage
    @image = @images[1]
  end

  #mouvement aléatoire
  def mouvement
    #puts @x
    if !@depart
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
  end

  # vitesse en x diminue (équivaut à un déplacement vers la gauche)
  def go_left
    @dernierDeplacement = 'left'
    if contactGauche
         @velocityX += 0.5
         @image = @images[1]
         @dernierDeplacement = 'right'
    else
        @velocityX -= 0.5
    end
    @image = @images[0]
  end

  # vitesse en x augmente (équivaut à un déplacement vers la droite)
  def go_right
    @dernierDeplacement = 'right'
    if contactDroit
        go_left
    else
        @velocityX += 0.5
    end
    @image = @images[1]
  end
#pas utilisé -----------------
  def tjVivant (tirs)
    tirs.reject! {|tir| collide?(tir)}
  end

  def collide?(item)
    distance = Gosu::distance(@x,@y,item.x, item.y)
    distance < 35
  end
#-------------------------------
  def update
    super
    self.mouvement
    self.move
  end

  def sol
      if contactBas
        @depart=false
        @velocityY = 0

      else
        @velocityY = 1
      end
  end

 def choixImage
   r = Random.new
   i=r.rand(0...@perso.length)
   @images = @perso[i]
 end

end
