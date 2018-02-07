require_relative 'personnage'
class Ennemi < Personnage
  # constructeur
  def initialize(x, y,map)
    super(x,y,map)
    #image du personnage
    @images = []
    # on ajoute les 4 images dans le tableau -- obligatoirement 2 images
    @images.push(Gosu::Image.new("res/enemis/DragonG.png"))
    @images.push(Gosu::Image.new("res/enemis/DragonG.png"))
    @image = @images[1]
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

  def tjVivant (tirs)
    tirs.reject! {|tir| collide?(tir)}
  end

  def collide?(item)
    distance = Gosu::distance(@x,@y,item.x, item.y)
    distance < 35
  end

  def update
    self.mouvement
    self.move
  end

  def sol
      if contactBas
        @velocityY = 0

      else
        @velocityY = 1
      end
  end


end
