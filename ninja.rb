require_relative 'hero'
class Ninja < Hero

  def initialize(x, y,map)
    super(x,y,map)
    @pv = 50
    @tempsAttente = 60

    #changer l'image et l'array d'images
    @images = []
    # on ajoute les 4 images dans le tableau -- obligatoirement 2 images
    @images.push(Gosu::Image.new("res/Ninjanul/ninjanulG.png"))
    @images.push(Gosu::Image.new("res/Ninjanul/ninjanulD.png"))

    # de base, le héros va a droite
    @image = @images[1]

    # attribut musique qui prend le fichier music.mp3 dans le répertoire res
    @song = []
    @song.push(Gosu::Sample.new("res/Ninjanul/nushacu.ogg"))
    @song.push(Gosu::Sample.new("res/Ninjanul/ninjaQuiTappe2.ogg"))
    @song.push(Gosu::Sample.new("res/Ninjanul/ninjaQuiSaute.ogg"))
    @song.push(Gosu::Sample.new("res/Ninjanul/sortQuiFoir2.ogg"))


    @projectile = Gosu::Image.new("res/Items/FlecheD.png")
  end

  def attaque1
    if(@temps == 0)
      @tirs.push(Tirs.new(@x,(@y+(@image.height/2)),@dernierDeplacement, @projectile)) if @dernierDeplacement == 'right'
      @tirs.push(Tirs.new(@x,(@y+(@image.height/2)),@dernierDeplacement, Gosu::Image.new("res/Items/FlecheG.png"))) if @dernierDeplacement == 'left'
      @temps=1;
    end
  end

  def attaque2(ennemis)
    if(@temps == 0)
      if rand(3) == 0
        @song[3].play
    else
        super(ennemis)
        @song[1].play
    end
      @temps=1
  end
end
end 
