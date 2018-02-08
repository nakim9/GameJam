require_relative 'hero'
class Epouvantail < Hero

  def initialize(x, y,map)
    super(x,y,map)
    @pv = 50
    @tempsAttente = 50

    #changer l'image et l'array d'images
    @images = []
    # on ajoute les 4 images dans le tableau -- obligatoirement 2 images
    @images.push(Gosu::Image.new("res/Epouvantail/BaseG.png"))
    @images.push(Gosu::Image.new("res/Epouvantail/BaseD.png"))

    # de base, le héros va a droite
    @image = @images[1]

    # attribut musique qui prend le fichier music.mp3 dans le répertoire res
    @song = []
    @song.push(Gosu::Sample.new("res/Epouvantail/saut.ogg"))
    @song.push(Gosu::Sample.new("res/Epouvantail/Corb.ogg"))

    @projectile = "res/Epouvantail/Corbeau.png"
  end

  def attaque1
    if(@temps == 0)
      @tirs.push(Tirs.new(@x,(@y+(@image.height/2)),@dernierDeplacement,@projectile,50)) if @dernierDeplacement == 'right'
      @tirs.push(Tirs.new(@x,(@y+(@image.height/2)),@dernierDeplacement,'res/Epouvantail/CorbeauG.png',50)) if @dernierDeplacement == 'left'
      @temps=1;
      @song[1].play
    end
  end

  def attaque2(ennemis)
    nil
  end

  def go_left
    if not contactBas
      super
    else
      @dernierDeplacement = 'left'
    end
  end

  def go_right
    if not contactBas
      super
    else
      @dernierDeplacement = 'right'
    end
  end

  def go_up
    super
    @song[0].play if contactBas
  end

end
