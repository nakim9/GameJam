require 'gosu'

#inclure les différents fichiers
require_relative 'enum'
require_relative 'hero'
require_relative 'window'
require_relative 'map'
require_relative 'carre'
require_relative 'ennemi'
require_relative 'tirs'

WindowWidth = WindowSize::Width
WindowHeight = WindowSize::Height

Window = Window.new(WindowWidth, WindowHeight)
Window.show
