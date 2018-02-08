
class SelectMapEdit < Gosu::Window

  def initialize(width, height)
    @att=1.0/8.0
    super(width, height)
    self.caption = "qfdsfqsdf"
    @nom=Array.new()
    @font = Gosu::Font.new(self, "Arial", 36)
  end

  def draw
    for i in 0..@nom.length-1
          @font.draw(@nom[i],Carr::Width*(i+1),WindowHeight/(2), 0, 1, 1, 0xff_f62217)
    end
  end

  def update
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
    entre if Gosu::button_down?(Gosu::KB_RETURN)

  end

  def suppr
    @nom.pop
    sleep(@att)
  end

  def nomMap
    str=""
    for i in 0..(@nom.length-1)
      str=str+@nom[i]
    end
    return str
    sleep(@att)
  end

  def entre
    nomMap="sansnom" if !nomMap
    nameMap="mapsEdit/"+nomMap
    wind = Editeur.new(WindowWidth, WindowHeight,nameMap)
    wind.show
    close
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
