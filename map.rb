# classe map

class Map
  attr_reader :list
   def initialize(name)
     @list = Array.new(15){Array.new(5,nil)}
     self.lectureMap(name)
  end

  def add(x,y,carre)
    @list[x][y]=carre
  end

  def draw
    i=0
    @list.each do |x|
      j=0
      x.each do |y|
        if y
      Gosu::draw_rect(i*CarreTaille::CarreWidth, j*CarreTaille::CarreHeight, CarreTaille::CarreWidth, CarreTaille::CarreHeight,  Gosu::Color.new(255, 255, 0, 0))
      end
      j=j+1
    end
    i=i+1
    end
  end

  def lectureMap(name)
    if File::exists?( name )
      aFile=File.open(name,"r")
      for y in 0..4
        for x in 0..14
          if aFile.sysread(1)=="1"
            self.add(x,y,Carre.new(1))
          else
            self.add(x,y,nil)
          end
        end
      end
      aFile.close
    end
  end

  def creationFil(name)
    aFile=File.new(name,"w")
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
