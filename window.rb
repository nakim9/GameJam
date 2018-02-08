class Window < Gosu::Window

  def initialize(width, height,map)
    super(width, height)
    @start = true
    @points = 0
    self.caption = "Mon jeu"
    @map=Map.new()
    @map.creeMap(map)
    @tChangement = 0
    #heros
    @heros = []
    @heros.push(PouleLicorne.new(width/2, height/2,@map))
    @heros.push(Vache.new(width/2, height/2,@map))
    @heros.push(Ivrogne.new(width/2, height/2,@map))
    @heros.push(RePonce.new(width/2, height/2,@map))
    chooseHero(1)
    @hero.localiser
    #hero2
    @heros2 = []
    @heros2.push(PouleLicorne.new(width/2, height/2,@map))
    @heros2.push(Vache.new(width/2, height/2,@map))
    @heros2.push(Ivrogne.new(width/2, height/2,@map))
    @heros2.push(RePonce.new(width/2, height/2,@map))
    @hero2 = nil
    @portails = []
    placePortails
    #ennemis
    @ennemis = []
    placeEnnemis
    #initilisation de la map
    @background_image1 = Gosu::Image.new("res/Ciel.png")
    @background_image2List = []
    @background_image2List.push(Gosu::Image.new("res/FondForet.png"))
    @background_image2List.push(Gosu::Image.new("res/Bateau.png"))
    @background_image2List.push(Gosu::Image.new("res/Eau.png"))
    @background_image2List.push(Gosu::Image.new("res/Enfer.png"))
    @background_image2List.push(Gosu::Image.new("res/Taverne.png"))
    @background_image2 = @background_image2List[0]
    #font pour les pvs
    @font = Gosu::Font.new(self, "Arial", 36)
    @camera_x = @camera_y = 0
    # attribut musique qui prend le fichier music.mp3 dans le répertoire res
    @song = Gosu::Song.new("res/theme principal.mp3")
    # fixe le volume à 0.25
    @song.volume = 0.25
    # lance la musique
    @song.play(true)
  end

  # fonction appelée 60 fois par seconde
  def update
    if gameOver? || @hero.arrive? || @hero.tomber? || @hero2 && @hero2.arrive? || @hero2 && @hero2.tomber?
      wind = WindowEnd.new(WindowSize::Width, WindowSize::Height)
      wind.setPoints(@points)
      if gameOver? || @hero.tomber? || @hero2 && @hero2.arrive?
        wind.cas(1)
      else
        wind.cas(2)
      end
      wind.show
      close
    else
      @points += 0.5
      # FAIRE fonction SI indiceTouchePressée EST touche
      @hero.go_left if Gosu::button_down?(Gosu::KbLeft)
      @hero.go_right if Gosu::button_down?(Gosu::KbRight)
      @hero.go_up if Gosu::button_down?(Gosu::KbUp)
      @hero.attaque1 if Gosu::button_down?(Gosu::KB_NUMPAD_1)
      @hero.attaque2(@ennemis) if Gosu::button_down?(Gosu::KB_NUMPAD_2)
      if Gosu::button_down?(Gosu::KB_W)||Gosu::button_down?(Gosu::KB_D)||Gosu::button_down?(Gosu::KB_A)
        if @hero2
          @hero2.go_left if Gosu::button_down?(Gosu::KB_A)
          @hero2.go_right if Gosu::button_down?(Gosu::KB_D)
          @hero2.go_up if Gosu::button_down?(Gosu::KB_W)
          @hero2.attaque1 if Gosu::button_down?(Gosu::KB_R)
          @hero2.attaque2(@ennemis) if Gosu::button_down?(Gosu::KB_T)
          @hero2.move
          @hero2.sol
          @hero2.tirs.each do |tirs|
            tirs.kill(@ennemis)
          end
          @hero2.passif(@ennemis)
          if (@hero2.temps!=0 && @hero2.temps<@hero2.tempsAttente)
            @hero2.incremente
          elsif @hero2.temps==@hero2.tempsAttente
            @hero2.setTemps(0)
            @hero2.cri
          end
          @hero2.tirs.each(&:update)

        else
          initialiserJ2
        end
      end
      #@hero.go_down if Gosu::button_down?(Gosu::KbDown)
      # la fonction move est appelée dans tous les cas
      if @points%100==0
        placeEnnemis
      end
      @hero.move
      @hero.sol
      @hero.tirs.each do |tirs|
        tirs.kill(@ennemis)
      end
      @hero.passif(@ennemis)
      if (@hero.temps!=0 && @hero.temps<@hero.tempsAttente)
        @hero.incremente
      elsif @hero.temps==@hero.tempsAttente
        @hero.setTemps(0)
        @hero.cri
      end
      @hero.tirs.each(&:update)

      @ennemis.reject! {|ennemi| ennemi.pv<=0}
      @portails.each do |portail|
        if  portail.enContact(@hero)
          @portails.delete(portail)
          chooseHero(1)
          chooseFond
        end
        if  @hero2 && portail.enContact(@hero2)
          @portails.delete(portail)
          chooseHero(1)
          chooseFond
        end
      end
      @ennemis.each(&:update)

      @ennemis.each do |ennemi|
        ennemi.sol
        #ennemi.tjVivant(@hero.tirs)
        @hero.enContact(ennemi)
        if @hero2
          @hero2.enContact(ennemi)
        end
      end

      @camera_x = [@hero.x - WindowSize::Width/2, 0].max
      @camera_y = 1
    end

    # fermer la fenêtre si la touche pressée est Echap
    close if Gosu::button_down?(Gosu::KbEscape)
  end
#----------------------------------------------------------------------------------------
  def draw
    @background_image1.draw(0, 0, ZOrder::Background)
    @background_image2.draw(0, WindowSize::Height-@background_image2.height, ZOrder::Background)
    Gosu.translate(-@camera_x, -@camera_y) do
      @portails.each(&:draw)
      @map.draw
      @hero.draw
      @ennemis.each(&:draw)
      @hero.tirs.each(&:draw)
      @ennemis.each do |ennemi|
          @font.draw(ennemi.pv.to_s, ennemi.x+(ennemi.image.width/2), ennemi.y-30, 0, 1, 1, 0xff_00ff00)
      end
      @font.draw("Player 1 : ", WindowWidth/5, WindowHeight/13, 3, 1, 1, 0xff_000000)
      @font.draw("Pour se déplacer utiliser les fleches (Haut,Droit,Gauche) ", WindowWidth/5, (WindowHeight/13)*2, 3, 1, 1, 0xff_000000)
      @font.draw("Les personnages peuvent avoit deux attaques : Vous pouvez les avtivées avec 1 et 2 du pad", WindowWidth/5, (WindowHeight/13)*3, 3, 1, 1, 0xff_000000)
      @font.draw("Bonne chance chère Niapoc! ", WindowWidth/5, (WindowHeight/13)*7, 3, 1, 1, 0xff_000000)

      if @hero2
        @font.draw("Player 2 ", WindowWidth/5, (WindowHeight/13)*4, 3, 1, 1, 0xff_000000)
        @font.draw("Pour se déplacer utiliser les fleches (Q,Z,D) ", WindowWidth/5, (WindowHeight/13)*5, 3, 1, 1, 0xff_000000)
        @font.draw("Les personnages peuvent avoit deux attaques : Vous pouvez les avtivées avec R et T", WindowWidth/5, (WindowHeight/13)*6, 3, 1, 1, 0xff_000000)
        @hero2.draw
        @hero2.tirs.each(&:draw)
      end
      #@font.draw("hg", @hero.hg[0], @hero.hg[1], 0, 1, 1, 0xff_0000ff)
      #@font.draw("hd", @hero.hd[0], @hero.hd[1], 0, 1, 1, 0xff_0000ff)
      #@font.draw("bg", @hero.bg[0], @hero.bg[1], 0, 1, 1, 0xff_0000ff)
      #@font.draw("bd", @hero.bd[0], @hero.bd[1], 0, 1, 1, 0xff_0000ff)
    end
    #pour afficher une info en haut de la fenetre (pv, gagner, perdu,...)

    @font.draw("Mes PV (J1):"+@hero.pv.to_s, 0, 0, 0, 1, 1, 0xff_ffffff)
    if @hero2
      @font.draw("Mes PV (J2):"+@hero2.pv.to_s, 0, 50, 0, 1, 1, 0xff_ffffff)
    else
      @font.draw("Mes PV (J2): appuyer sur Z,Q ou D pour rejoidre la partie", 0, 50, 0, 1, 1, 0xff_ffffff)

    end

  end

  def placeEnnemis
    i=0
    @map.list.each do |x|
      j=0
      x.each do |y|
        if y && y.type==Carr::Ennemi
          point = coodonees(i,j)
          @ennemis.push(Ennemi.new(point[0], point[1],@map))
        end
      j=j+1
    end
    i=i+1
    end
  end

  def placePortails
    i=0
    @map.list.each do |x|
      j=0
      x.each do |y|
        if y && y.type==Carr::Portail
          point = coodonees(i,j)
          @portails.push(Portail.new(point[0], point[1],@map))
        end
      j=j+1
    end
    i=i+1
    end
  end

  def coodonees(i,j)
       point = []
       point.push(i*Carr::Width)
       point.push(j*Carr::Height)
       return point
  end

  def gameOver?
    return @hero.pv <= 0
  end

  def chooseHero(int)
    if int==1
      if @start
        r = Random.new
        i=r.rand(0...@heros.length)
        @hero = @heros[i]
        @start = false
      else
        r = Random.new
        i=r.rand(0...@heros.length)
        px = @hero.x
        py = @hero.y
        @hero = @heros[i]
        @hero.positionner(px,py)
      end
    elsif int==2
      if @hero2
        r = Random.new
        i=r.rand(0...@heros2.length)
        px = @hero2.x
        py = @hero2.y
        @hero2 = @heros2[i]
        @hero2.positionner(px,py)
      else
        r = Random.new
        i=r.rand(0...@heros2.length)
        @hero2 = @heros2[i]
      end
    end
  end

  def chooseFond
      r = Random.new
      i=r.rand(0...@background_image2List.length)
      @background_image2 = @background_image2List[i]
  end

  def initialiserJ2
    chooseHero(2)
    @hero.localiser
  end


end
