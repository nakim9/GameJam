# classe map
class Carre
  attr_reader :image
   def initialize(type)
     @start=type==Carr::Start
     @arrive=type==Carr::Arrive
     @image=image

   end

end
