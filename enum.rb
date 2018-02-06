# énuméré pour la profondeur

module ZOrder
  # 2e plan : image de fond
  Background = 0
  # 1er plan : image du héros
  Hero = 1
end

module WindowSize
     Width = 1920
     Height = 1080
end

module Carr
    Width=WindowSize::Width/10
    Height=WindowSize::Height/5
    Terre="T"
    Vide="O"

end
module NbCarre
  Height = 7
end
