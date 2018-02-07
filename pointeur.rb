class Pointeur
  def initialize(x,y,map)
    @carres= Queue.new()
      @carres.push(Carre.new(Carr::Arrive))
      @carres.push(Carre.new(Carr::ArbreL3))
      @carres.push(Carre.new(Carr::Bateau))
      @carres.push(Carre.new(Carr::Jes))
      @carres.push(Carre.new(Carr::Ennemi))
      @carres.push(Carre.new(Carr::Enfer))
      @carres.push(Carre.new(Carr::Enfer2))
      @carres.push(Carre.new(Carr::Herbe))
      @carres.push(Carre.new(Carr::Enfer3))
      @carres.push(Carre.new(Carr::Arbre))
      @carres.push(Carre.new(Carr::Start))
      @carres.push(Carre.new(Carr::ArbreL2))
      @carres.push(Carre.new(Carr::Terre))
      @carres.push(Carre.new(Carr::Arc))
      @carres.push(Carre.new(Carr::ArbreL1))
    @carre=@carres.pop()
    @map=map
    @x=x
    @y=y
  end

  def draw
    @carre.draw(@x,@y)
  end

  def switchCarre
    sleep(1.0/8.0)
    @carre=@carres.pop()
    @carres.push(@carre)
  end


  def go_left
    if @x!=0
      @x-=1
    end
    sleep(1.0/8.0)
  end

  # vitesse en x augmente (équivaut à un déplacement vers la droite)
  def go_right
    if @x!=@map.width
      @x+=1
    end
    sleep(1.0/8.0)
  end

  # vitesse en y diminue (équivaut à un déplacement vers le haut)
  def go_up
    if @y!=0
      @y-=1
    end
    sleep(1.0/8.0)
  end

  # vitesse en y augmente (équivaut à un déplacement vers le bas)
  def go_down
    if @y!=NbCarre::Height
      @y+=1
    end
    sleep(1.0/8.0)
  end

  def add
    @map.add(@x,@y,@carre)
    sleep(1.0/8.0)
  end
  # modification des coordonées du héros

end
