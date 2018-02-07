
class Editeur < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Editeur"
    @map=Map.new()
    @ptr=Pointeur.new(0,0,@map)
    @camera_x = @camera_y = 0
    end

    def update
      self.nouveau if Gosu::button_down?(Gosu::KB_F9)
      @ptr.go_left if Gosu::button_down?(Gosu::KbLeft)
      @ptr.go_right if Gosu::button_down?(Gosu::KbRight)
      @ptr.go_down if Gosu::button_down?(Gosu::KbDown)
      @ptr.go_up if Gosu::button_down?(Gosu::KbUp)
      @ptr.switchCarre if Gosu::button_down?(Gosu::KB_TAB)
      @ptr.add if Gosu::button_down?(Gosu::KB_LEFT_CONTROL)
      @ptr.efface if  Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
      @map.creationFil("mapsEdit/sav") if Gosu::button_down?(Gosu::KB_F5)
      @camera_x = [@ptr.x*Carr::Width - WindowSize::Width/2, 0].max
      @camera_y = 1
    end

    def draw
      Gosu.translate(-@camera_x, -@camera_y) do
      @map.draw
      @ptr.draw
    end
    end

    def nouveau
      @map.clearList(30)
      @ptr.ptrClear(@map)
    end
end
