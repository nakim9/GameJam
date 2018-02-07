require_relative 'hero'
class Vache < Hero

  def initialize(x, y,map)
    super(x,y,map)
    @pv = 50
    @tempsAttente = 50

    #changer l'image et l'array d'images
    @images = []
    # on ajoute les 4 images dans le tableau -- obligatoirement 2 images
    @images.push(Gosu::Image.new("res/pouleLicorne/PoulicorneG.png"))
    @images.push(Gosu::Image.new("res/pouleLicorne/PoulicorneD.png"))
    @images.push(Gosu::Image.new("res/pouleLicorne/PoulicorneOeuf.png"))

    # de base, le héros va a droite
    @image = @images[1]

    # attribut musique qui prend le fichier music.mp3 dans le répertoire res
    @song = []
    @song.push(Gosu::Song.new("res/music.mp3"))

    # fixe le volume à 0.25
    @song.volume = 0.25
    # lance la musique
    @song.play(true)
  end

  def attaque1
    if(@temps == 0)
      #changer l'image du tir
      if @dernierDeplacement=='left'
        @tirs.push(Tirs.new(@x,(@y+(@image.height/2)),'right',"res/pouleLicorne/Oeuf.png"))
      else
        @tirs.push(Tirs.new(@x,(@y+(@image.height/2)),'left',"res/pouleLicorne/Oeuf.png"))
      end
      @temps=1;
      @image = @images[2]
    end
  end
end