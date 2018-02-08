require_relative 'hero'
class Ivrogne < Hero
  def initialize(x, y,map)
    super(x,y,map)
    @pv = 150
    @tempsAttente = 50

    #changer l'image et l'array d'images
    @images = []
    # on ajoute les 4 images dans le tableau -- obligatoirement 2 images
    @images.push(Gosu::Image.new("res/Ivrogne/ivrogneG.png"))
    @images.push(Gosu::Image.new("res/Ivrogne/ivrogneD.png"))

    # de base, le héros va a droite
    @image = @images[1]

    # image du projectile (de base fireball)
    @projectile = "res/pouleLicorne/Oeuf.png"

    # attribut musique qui prend le fichier music.mp3 dans le répertoire res
    @song = []
    @song.push(Gosu::Sample.new("res/Ivrogne/ivrogne.ogg"))
  end

  def go_left
    @dernierDeplacement = 'left'
    if contactGauche
         @velocityX = 0
    else
        @velocityX += 0.5
    end
    @image = @images[0]
  end

  # vitesse en x augmente (équivaut à un déplacement vers la droite)
  def go_right
    @dernierDeplacement = 'right'
    if contactDroit
        @velocityX = 0
    else
        @velocityX -= 0.5
    end
    @image = @images[1]
  end

  def attaque1
    if(@temps == 0)
      #changer l'image du tir
      @tirs.push(Tirs.new(@x,(@y+(@image.height/2)), @dernierDeplacement,@projectile))
      @temps=1;
      @song[0].play
    end
  end

  def attaque2(ennemis)
      super(ennemis)
      @song[0].play
  end
end
