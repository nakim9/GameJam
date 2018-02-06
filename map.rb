# classe map

class Map
  attr_reader :list
   def initialize(name)
     @width=15
     @list = Array.new(@width){Array.new(5,nil)}
     self.lectureMap(name)
  end

  def add(x,y,carre)
    print(x)
    print(y)
    print("\n")
    @list[x][y]=carre

  end

  def draw
    i=0
    @list.each do |x|
      j=0
      x.each do |y|
        if y
      Gosu::draw_rect(i*Carre::Width, j*Carre::Height, Carre::Width, Carre::Height,  Gosu::Color.new(255, 255, 0, 0))
      end
      j=j+1
    end
    i=i+1
    end
  end

  def lectureMap(name)
    if File::exists?( name )
      aFile=File.open(name,"r")
      centaine=aFile.sysread(1)
      disaine=aFile.sysread(1)
      uniter=aFile.sysread(1)
      @width=centaine.to_i*100+disaine.to_i*10+uniter.to_i
      print(@width)
      @list = Array.new(@width){Array.new(5,nil)}
      aFile.sysread(1)
      for y in 0..NbCarre::Height-1
        x=0
        notfin=true
        while notfin
          c=aFile.sysread(1)
          if c=="1"
            self.add(x,y,Carre.new(1))
          elsif c=="\n"
            notfin=false
          else
            self.add(x,y,nil)
          end
          x+=1
        end
      end
      aFile.close
    end
  end

  def creationFil(name)
    aFile=File.new(name,"w")
    aFile.syswrite(@width)
    aFile.syswrite("\n")
    for y in 0..4
      for x in 0..14
        if @list[x][y]
        aFile.syswrite("1")
      else
        aFile.syswrite("0")
      end
      end
      aFile.syswrite("\n")
    end
        aFile.close
    end

end
