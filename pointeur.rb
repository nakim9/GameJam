class Pointeur
  attr_reader :map,:x,:y
  def initialize(x,y,map)
    @carres= Array.new()
      @carres.push(Carre.new(Carr::Portail))
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

    @ptrCarres=0
    @carre=@carres[@ptrCarres]
    @map=map
    @x=x
    @y=y
  end

  def efface
    @map.add(@x,@y,nil)
  end


  def draw
    if @carre
      @carre.draw(@x,@y)
    end
  end

  def switchCarrea
    sleep(1.0/8.0)
    @ptrCarres=(@ptrCarres+1)% (@carres.length-1)
    @carre=@carres[@ptrCarres]
  end

  def switchCarrez
    sleep(1.0/8.0)
    @ptrCarres=(@ptrCarres-1)% (@carres.length-1)
    @carre=@carres[@ptrCarres]
  end

  def go_left
    if @x!=0
      @x-=1
    end
    sleep(1.0/8.0)
  end

  # vitesse en x augmente (équivaut à un déplacement vers la droite)
  def go_right
    if @x!=@map.width-1
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
    if @y!=NbCarre::Height-1
      @y+=1
    end
    sleep(1.0/8.0)
  end

  def add
    @map.add(@x,@y,@carre)
    sleep(1.0/8.0)

  end

  def ptrClear(map)
    @map=map
    @x=0
    @y=0
  end
  # modification des coordonées du héros

end
