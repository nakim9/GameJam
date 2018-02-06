require_relative 'personnage'
class Ennemi < Personnage
  # constructeur
  def initialize(x, y,map)


    super(x,y,map)

    #image du personnage
    @image = Gosu::Image.new("res/hero.png")
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
         puts "blocké left"
         go_right
    else
        @velocityX -= 0.5
    end
    @image = @images[0]
  end

  # vitesse en x augmente (équivaut à un déplacement vers la droite)
  def go_right
    @dernierDeplacement = 'right'
    if contactDroit
        puts "blocké right"
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
