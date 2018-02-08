require_relative 'hero'
class RePonce < Hero

  def initialize(x, y,map)
    super(x,y,map)
    @pv = 50
    @tempsAttente = 50

    #changer l'image et l'array d'images
    @images = []
    # on ajoute les 4 images dans le tableau -- obligatoirement 2 images
    @images.push(Gosu::Image.new("res/Raiponce/BaseG.png"))
    @images.push(Gosu::Image.new("res/Raiponce/BaseD.png"))
    @images.push(Gosu::Image.new("res/Raiponce/TaperG.png"))
    @images.push(Gosu::Image.new("res/Raiponce/TaperD.png"))

    # de base, le héros va a droite
    @image = @images[1]

    # image du projectile (de base fireball)
    @projectile = "res/Raiponce/cheveux.png"

    # attribut musique qui prend le fichier music.mp3 dans le répertoire res
    @song = []
    @song.push(Gosu::Sample.new("res/Raiponce/poele.ogg"))

  end

  def attaque1
    if(@temps == 0)
      #changer l'image du tir
      @tirs.push(Tirs.new(@x,(@y+(@image.height/2)), @dernierDeplacement,@projectile,0))
      @temps=1
    end
  end

  def attaque2(ennemis)
    if(@temps == 0)
      super(ennemis)
      @image = @images[2] if @dernierDeplacement == 'left'
      @image = @images[3] if @dernierDeplacement == 'right'
      @song[0].play
      @temps =1
    end
  end

  def passif(ennemis)
    @tirs.each{ |tir|
      ennemis.each{ |ennemi|
        if tir.enContact(ennemi)
          ennemi.stuned = 60*3
        end
      }
    }
  end
#FAIRE PASSIF ET ATTAQUE 1
end
