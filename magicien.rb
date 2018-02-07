require_relative 'hero'
class Magicien < Hero

  def initialize(x, y,map)
    super(x,y,map)
    @pv = 50
    @tempsAttente = 50

    #changer l'image et l'array d'images
    @images = []
    # on ajoute les 4 images dans le tableau -- obligatoirement 2 images
    @images.push(Gosu::Image.new("res/Magicien/MagicienG.png"))
    @images.push(Gosu::Image.new("res/Magicien/MagicienD.png"))
    @images.push(Gosu::Image.new("res/Magicien/MagicienCoup2.png"))
    @images.push(Gosu::Image.new("res/Magicien/MagicienCoup3.png"))

    # de base, le héros va a droite
    @image = @images[1]

    # attribut musique qui prend le fichier music.mp3 dans le répertoire res
    @song = []
    @song.push(Gosu::Song.new("res/Magicien/sortQuiFoir1.mp3"))
    @song.push(Gosu::Song.new("res/Magicien/sortQuiReussi.mp3"))
    @song.push(Gosu::Song.new("res/Magicien/MagicienQuiMeurt.mp3"))
  end

  def attaque1
    if(@temps == 0)
         @image = @images[3]
         @song[1].volume = Volume::Bruit
         @song[1].play
         @temps=1
    end
  end

  def attaque2(ennemis)
      super(ennemis)
      @image = @images[2]
      @song[0].volume = Volume::Bruit
      @song[0].play
  end
end
