require_relative 'hero'
class Ivrogne < Hero
  def initialize(x, y,map)
    super(x,y,map)
    @pv = 150
    @tempsAttente = 50

    #changer l'image et l'array d'images
    @images = []
    # on ajoute les 4 images dans le tableau -- obligatoirement 2 images
    @images.push(Gosu::Image.new("res/vache/vacheG.png"))
    @images.push(Gosu::Image.new("res/vache/vacheD.png"))
    @images.push(Gosu::Image.new("res/vache/vacheCoup2.png"))
    @images.push(Gosu::Image.new("res/vache/vacheCharme.png"))

    # de base, le héros va a droite
    @image = @images[1]

    # attribut musique qui prend le fichier music.mp3 dans le répertoire res
    @song = []
    @song.push(Gosu::Song.new("res/vache/meu1.mp3"))
    @song.push(Gosu::Song.new("res/vache/VacheCharme1.mp3"))
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
      @tirs.push(Tirs.new(@x,(@y+(@image.height/2)), @dernierDeplacement,"res/pouleLicorne/Oeuf.png"))
      @temps=1;
      @image = @images[2]
      @song[0].volume = Volume::Bruit
      @song[0].play
    end
  end

  def attaque2(ennemis)
      super(ennemis)
      @image = @images[2]
      @song[0].volume = Volume::Bruit
      @song[0].play
  end
end