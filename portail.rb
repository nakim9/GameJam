class Portail
  def initialize(map)
    @map = map
    #dernier sens de déplacement
    @x=0
    @y=0
    @image = Gosu::Image.new("res/cube/Portail.png")
    placer
  end

  def placer
      i=0
      @map.list.each do |x|
        j=0
        x.each do |y|
          if y && y.type==Carr::Portail
            point = coodonees(i,j)
            @x = point[0]
            @y = point[1] - @image.height
          end
        j=j+1
      end
      i=i+1
      end
  end
  #methode pour avoir les coordonnées a partir de l'emplacement du carré
       def coodonees(i,j)
            point = []
            point.push(i*Carr::Width)
            point.push(j*Carr::Height)
            return point
       end

  def draw
    @image.draw(@x, @y, 3, 1, 1)
  end
end
