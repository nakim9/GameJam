
class SelectMapEdit < Gosu::Window

  def initialize(width, height)
    @att=1.0/8.0
    super(width, height)
    self.caption = "qfdsfqsdf"
    @nom=Array.new()
    @taille=Array.new()
    @font = Gosu::Font.new(self, "Arial", 36)
    @lettre=true
    @image=Gosu::Image.new("res/acceuil.png")
  end

  def draw
    @image.draw(0, 0, ZOrder::Background)
    @font.draw("Saisir le nom de la Map : ",  WindowHeight/(8), WindowHeight/8, 0, 1, 1, 0xff_0000ff)
    @font.draw("Saisir la taille : ",  WindowHeight/(8), WindowHeight/3, 0, 1, 1, 0xff_0000ff)
    if @lettre
      Gosu::draw_rect(Carr::Width, WindowHeight/8+75,WindowWidth-Carr::Width, Carr::Height,  Gosu::Color.new(255, 255, 0, 0))
    else
      Gosu::draw_rect(Carr::Width, WindowHeight/3+75,WindowWidth-Carr::Width, Carr::Height,  Gosu::Color.new(255, 255, 0, 0))
    end
    for i in 0..@nom.length-1
          @font.draw(@nom[i],Carr::Width*(i+1),WindowHeight/8+75, 0, 1, 1, 0xff_0000ff)
    end
    for i in 0..@taille.length-1
          @font.draw(@taille[i],Carr::Width*(i+1),WindowHeight/3+75, 0, 1, 1, 0xff_0000ff)
    end
  end

  def update
    if @lettre
    a if Gosu::button_down?(Gosu::KB_Q)
    b if Gosu::button_down?(Gosu::KB_B)
    c if Gosu::button_down?(Gosu::KB_C)
    d if Gosu::button_down?(Gosu::KB_D)
    e if Gosu::button_down?(Gosu::KB_E)
    f if Gosu::button_down?(Gosu::KB_F)
    g if Gosu::button_down?(Gosu::KB_G)
    h if Gosu::button_down?(Gosu::KB_H)
    i if Gosu::button_down?(Gosu::KB_I)
    j if Gosu::button_down?(Gosu::KB_J)
    k if Gosu::button_down?(Gosu::KB_K)
    l if Gosu::button_down?(Gosu::KB_L)
    m if Gosu::button_down?(Gosu::KB_SEMICOLON)
    n if Gosu::button_down?(Gosu::KB_N)
    o if Gosu::button_down?(Gosu::KB_O)
    p if Gosu::button_down?(Gosu::KB_P)
    q if Gosu::button_down?(Gosu::KB_A)
    r if Gosu::button_down?(Gosu::KB_R)
    s if Gosu::button_down?(Gosu::KB_S)
    t if Gosu::button_down?(Gosu::KB_T)
    u if Gosu::button_down?(Gosu::KB_U)
    v if Gosu::button_down?(Gosu::KB_V)
    w if Gosu::button_down?(Gosu::KB_Z)
    x if Gosu::button_down?(Gosu::KB_X)
    y if Gosu::button_down?(Gosu::KB_Y)
    z if Gosu::button_down?(Gosu::KB_W)
    suppr if Gosu::button_down?(Gosu::KB_BACKSPACE)
    else
    zero if Gosu::button_down?(Gosu::KB_0)
    un if Gosu::button_down?(Gosu::KB_1)
    deux if Gosu::button_down?(Gosu::KB_2)
    trois if Gosu::button_down?(Gosu::KB_3)
    quatre if Gosu::button_down?(Gosu::KB_4)
    cinq if Gosu::button_down?(Gosu::KB_5)
    six if Gosu::button_down?(Gosu::KB_6)
    sept if Gosu::button_down?(Gosu::KB_7)
    huit if Gosu::button_down?(Gosu::KB_8)
    neuf if Gosu::button_down?(Gosu::KB_9)
    suppr if Gosu::button_down?(Gosu::KB_BACKSPACE)
    end
    swap if Gosu::button_down?(Gosu::KB_UP)
    swap if Gosu::button_down?(Gosu::KB_DOWN)
    entre if Gosu::button_down?(Gosu::KB_RETURN)
    close if Gosu::button_down?(Gosu::KbEscape)

  end

  def swap
    @lettre= (!@lettre)
    sleep(1.0/8.0)
  end

  def suppr
    @nom.pop
    sleep(@att)
  end
  def supprint
    @taille.pop
    sleep(@att)
  end

  def nomMap
    str=""
    for i in 0..(@nom.length-1)
      str=str+@nom[i]
    end
    return str
  end

  def tailletoint
    if @taille!=Array.new
    ta=0
    @taille=@taille.reverse
    for i in 0..(@taille.length-1)
      ta=ta+@taille[i]*10**i
    end
    return ta
    else
      return 0
    end
  end

  def entre
    if @lettre==false
    namMap=nomMap
    if namMap ==""
      namMap="sansnom"
    end
    nameMap="mapsDebut/"+namMap
    taille=tailletoint
    if taille==0
      taille=100
    end
    wind = Editeur.new(WindowWidth, WindowHeight,nameMap,taille)
    wind.show
    close
    else
      swap
    end
  end

  def zero
    @taille.push(0)
    sleep(@att)
  end

  def un
    @taille.push(1)
    sleep(@att)
  end

  def deux
    @taille.push(2)
    sleep(@att)
  end

  def trois
    @taille.push(3)
    sleep(@att)
  end

  def quatre
    @taille.push(4)
    sleep(@att)
  end

  def cinq
    @taille.push(5)
    sleep(@att)
  end

  def six
    @taille.push(6)
    sleep(@att)
  end

  def sept
    @taille.push(7)
    sleep(@att)
  end

  def huit
    @taille.push(8)
    sleep(@att)
  end

  def neuf
    @taille.push(9)
    sleep(@att)
  end

  def a
    @nom.push("a")
    sleep(@att)
  end

  def b
    @nom.push("b")
    sleep(@att)
  end

  def c
    @nom.push("c")
    sleep(@att)
  end

  def d
    @nom.push("d")
    sleep(@att)
  end

  def e
    @nom.push("e")
    sleep(@att)
  end

  def f
    @nom.push("f")
    sleep(@att)
  end

  def g
    @nom.push("g")
    sleep(@att)
  end

  def h
    @nom.push("h")
    sleep(@att)
  end

  def i
    @nom.push("i")
    sleep(@att)
  end

  def j
    @nom.push("j")
    sleep(@att)
  end

  def k
    @nom.push("k")
    sleep(@att)
  end

  def l
    @nom.push("l")
    sleep(@att)
  end

  def m
    @nom.push("m")
    sleep(@att)
  end

  def n
    @nom.push("n")
    sleep(@att)
  end

  def o
    @nom.push("o")
    sleep(@att)
  end

  def p
    @nom.push("p")
    sleep(@att)
  end

  def q
    @nom.push("q")
    sleep(@att)
  end

  def r
    @nom.push("r")
    sleep(@att)
  end

  def s
    @nom.push("s")
    sleep(@att)
  end

  def t
    @nom.push("t")
    sleep(@att)
  end

  def u
    @nom.push("u")
    sleep(@att)
  end

  def v
    @nom.push("v")
    sleep(@att)
  end

  def w
    @nom.push("w")
    sleep(@att)
  end

  def x
    @nom.push("x")
    sleep(@att)
  end

  def y
    @nom.push("y")
    sleep(@att)
  end

  def z
    @nom.push("z")
    sleep(@att)
  end

end
