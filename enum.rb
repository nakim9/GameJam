# énuméré pour la profondeur

module ZOrder
  # 2e plan : image de fond
  Background = 0
  # 1er plan : image du héros
  Hero = 1
end

module WindowSize
     Width = 1280
     Height = 720
end

module NbCarre
  Height = 7
end

module Carr
    Width = Height=WindowSize::Height/NbCarre::Height
    Terre="T"
    Vide="O"

end
<<<<<<< HEAD
module NbCarre
  Height = 5
end
=======
>>>>>>> d46356663616f4f0a837a0ac554b5e4eee1a0413
