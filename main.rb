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
<<<<<<< HEAD
require_relative 'WindowSelectNiveau'
=======
require_relative 'portail'
>>>>>>> eb0ea7c81405fa1a193746dcb38cd119d90df00c
require_relative 'editeur'
require_relative 'pointeur'

WindowWidth = WindowSize::Width
WindowHeight = WindowSize::Height
wind=WindowStart.new(WindowWidth,WindowHeight)
wind.show

#Window.show
