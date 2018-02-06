# classe map

class Map
  attr_reader :list
   def initialize()
     @list = Array.new(15){Array.new(5,nil)}
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
      Gosu::draw_rect(i*CarreTaille::Width, j*CarreTaille::Height, CarreTaille::Width, CarreTaille::Height,  Gosu::Color.new(255, 255, 0, 0))
      end
      j=j+1
    end
    i=i+1
    end
  end

end
