# énuméré pour la profondeur

module ZOrder
  # 2e plan : image de fond
  Background = 0
  # 1er plan : image du héros
  Hero = 1
end

module WindowSize
     Width = 800
     Height = 600
end

module NbCarre
  Height = 7
end

module Carr
    Width = Height=WindowSize::Height/NbCarre::Height
    Terre="T"
    Vide="O"

end
