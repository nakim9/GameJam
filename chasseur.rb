require_relative 'hero'
class Chasseur < Hero
  def initialize(x, y,map)
    super(x,y,map)
    @pv = 50
    @tempsAttente = 60

    #changer l'image et l'array d'images
    @images = []
    # on ajoute les 4 images dans le tableau -- obligatoirement 2 images
    @images.push(Gosu::Image.new("res/Chasseur/ChasseurBaseG.png"))
    @images.push(Gosu::Image.new("res/Chasseur/ChasseurBaseD.png"))
    @images.push(Gosu::Image.new("res/Chasseur/ChasseurTireG.png"))
    @images.push(Gosu::Image.new("res/Chasseur/ChasseurTireD.png"))

    # de base, le héros va a droite
    @image = @images[1]

    # image du projectile (de base fireball)
    @projectile = "res/fire.png"

    # attribut musique qui prend le fichier music.mp3 dans le répertoire res
    @song = []
    @song.push(Gosu::Sample.new("res/Chasseur/Tire.ogg"))
  end

  def attaque1
    if(@temps == 0)
      @image = @images[2] if @dernierDeplacement == 'left'
      @image = @images[3] if @dernierDeplacement == 'right'
      #changer l'image du tir
      @tirs.push(Tirs.new(@x,(@y+(@image.height/2)), @dernierDeplacement,@projectile,45))
      @temps=1;
      @song[0].play
    end
  end

  def attaque2(ennemis)

  end


end
