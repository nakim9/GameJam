require 'gosu'

#inclure les différents fichiers
require_relative 'enum'
require_relative 'hero'
require_relative 'window'
require_relative 'map'
require_relative 'carre'
require_relative 'ennemi'
require_relative 'tirs'
require_relative 'WindowStart'
require_relative 'personnage'
require_relative 'test'
require_relative 'PouleLicorne'

WindowWidth = WindowSize::Width
WindowHeight = WindowSize::Height
<<<<<<< HEAD

Window =Window.new(WindowWidth, WindowHeight)
Window.show
=======
WindowStart = WindowStart.new(WindowWidth, WindowHeight)
WindowStart.show
Window = Window.new(WindowWidth, WindowHeight)
#Window.show
>>>>>>> d46356663616f4f0a837a0ac554b5e4eee1a0413
