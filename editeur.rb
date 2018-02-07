
class Editeur < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Editeur"
    @map=Map.new()
    @ptr=Pointeur.new(0,0,@map)
    end

    def update
      self.nouveau if Gosu::button_down?(Gosu::KB_F9)
      @ptr.go_left if Gosu::button_down?(Gosu::KbLeft)
      @ptr.go_right if Gosu::button_down?(Gosu::KbRight)
      @ptr.go_down if Gosu::button_down?(Gosu::KbDown)
      @ptr.go_up if Gosu::button_down?(Gosu::KbUp)
      @ptr.switchCarre if Gosu::button_down?(Gosu::KB_TAB)
      @ptr.add if Gosu::button_down?(Gosu::KB_ENTER)
      @map.creationFil("mapsEdit/sav") if Gosu::button_down?(Gosu::KB_F5)
    end

    def draw
      @map.draw
      @ptr.draw
    end

    def nouveau
      @map.clearList(10)
      @ptr.ptrClear(@map)
    end
end
