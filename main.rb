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
require_relative 'PouleLicorne'
require_relative 'Vache'
require_relative 'Ivrogne'
require_relative 'WindowEnd'
require_relative 'Magicien'
require_relative 'Vampire'
require_relative 'Arbre'
require_relative 'Chasseur'
require_relative 'RePonce'

require_relative 'editeur'
require_relative 'pointeur'
WindowWidth = WindowSize::Width
WindowHeight = WindowSize::Height
WindowStart=WindowStart.new(WindowWidth,WindowHeight)
WindowStart.show

#Window.show
