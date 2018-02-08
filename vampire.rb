require_relative 'hero'
class Vampire < Hero

  def initialize(x, y,map)
    super(x,y,map)
    @pv = 100
    @tempsAttente = 50

    #changer l'image et l'array d'images
    @images = []
    # on ajoute les 4 images dans le tableau -- obligatoirement 2 images
    @images.push(Gosu::Image.new("res/Vampire/vampG.png"))
    @images.push(Gosu::Image.new("res/Vampire/vampD.png"))

    # de base, le héros va a droite
    @image = @images[1]

    # attribut musique qui prend le fichier music.mp3 dans le répertoire res
    @song = []
    @song.push(Gosu::Song.new("res/Vampire/vampire.mp3"))

  end

  def attaque1
    if(@temps == 0)
      #Chauve-souris
      @temps=1
    end
  end

  def attaque2(ennemis)
    ennemis.each do |ennemi|
      if self.enContact(ennemi)
        ennemi.subir(25)
        if pv < 90
          @pv += 10
        else
          @pv = 100
        end
      end
    end
    @song[0].volume = Volume::Bruit
    @song[0].play
  end

  #en contact a quelque chose (objet et non map)
  def enContact(item)
    distance = Gosu::distance(@x,@y,item.x, item.y)
    if distance<75
      @pv -= 1 * (100/@pv)
    end
  end
end
