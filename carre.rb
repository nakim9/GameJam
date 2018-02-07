# classe map
class Carre
  attr_reader :image, :start, :type
   def initialize(type)
     @start=type==Carr::Start
     @arrive=type==Carr::Arrive
     @type=type
     if @type==Carr::Terre
       @image=Gosu::Image.new("res/cube/Terre2.png")
     else
       @image=nil
     end
   end

   def draw(i,j)
     if @image
     @image.draw(i*Carr::Width,j*Carr::Height,ZOrder::Hero)
   else
     Gosu::draw_rect(i*Carr::Width, j*Carr::Height, Carr::Width, Carr::Height,  Gosu::Color.new(255, 255, 0, 0))
   end
 end



end
