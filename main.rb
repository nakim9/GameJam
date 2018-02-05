require 'gosu'

#inclure les différents fichiers
require_relative 'enum'
require_relative 'hero'
require_relative 'window'


WindowWidth = WindowSize::Width
WindowHeight = WindowSize::Height

Window = Window.new(WindowWidth, WindowHeight)
Window.show
