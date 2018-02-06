# énuméré pour la profondeur

module ZOrder
  # 2e plan : image de fond
  Background = 0
  # 1er plan : image du héros
  Hero = 1
end

module WindowSize
     Width = 1000
     Height = 500
end

module CarreTaille
    CarreWidth=WindowSize::Width/10
    CarreHeight=WindowSize::Height/5
end
module NbCarre
  Height = 5
end
