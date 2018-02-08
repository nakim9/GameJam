require_relative 'hero'
class Pestifere < Hero

  def initialize(x, y,map)
    super(x,y,map)
    @pv = 40
    @tempsAttente = 50

    #changer l'image et l'array d'images
    @images = []
    # on ajoute les 4 images dans le tableau -- obligatoirement 2 images
    @images.push(Gosu::Image.new("res/Pestiféré/BaseG.png"))
    @images.push(Gosu::Image.new("res/Pestiféré/BaseD.png"))

    # de base, le héros va a droite
    @image = @images[1]

    # attribut musique qui prend le fichier music.mp3 dans le répertoire res
    @song = []
    @song.push(Gosu::Sample.new("res/Pestiféré/tousse.ogg"))

    @projectile = "res/Items/poison.png"
  end

  def attaque1
    if(@temps == 0)
      @tirs.push(Tirs.new(@x,(@y+(@image.height/2)),@dernierDeplacement,@projectile,50))
      @temps=1;
      @song[0].play
    end
  end

  def attaque2(ennemis)

  end

  def passif(ennemis)
    ennemis.each{|ennemi|
      ennemi.pv -= 2 if ennemi.enContact(self)
    }
  end

end
