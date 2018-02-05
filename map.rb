# classe map

class Map
   def initialize()
     @list = Array.new(10)
     @list.each do |i|
       i=Array.new(5)
     end
  end
  
  def add(x,y,color)
    @list[x][y]=color
  end

  def draw
    @list.each do |i|
      i.each do |x|
      x.draw
      end
    end
  end
end
