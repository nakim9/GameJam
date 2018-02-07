class Personnage
    attr_reader :x, :y, :image, :pv
    # constructeur
    def initialize(x, y,map)
      #pv du heros
      @pv = 100
      #dernier sens de déplacement
      @dernierDeplacement = 'right'
      @map=map
      # coordonnées
      @x = x
      @y = y
      @radius = 10
      # vitesse (de base 0 : à l'arret)
      @velocityX = 0.0
      @velocityY = 1
      #image du personnage
      # création d'un tableau qui contiendra les différentes images du héros
      @images = []
      # on ajoute les 4 images dans le tableau
      @images.push(Gosu::Image.new("res/hero/gauche.png"))
      @images.push(Gosu::Image.new("res/hero/droite.png"))
      # de base, le héros va a droite
      @image = @images[1]
    end

    def draw
         carrW = Carr::Width.to_f
         carrH = Carr::Height.to_f
         heroW = carrW/@image.width.to_f
         heroH = (carrH*2.0)/@image.height.to_f
      @image.draw(@x, @y, ZOrder::Hero, 1, 1)
    end

    # vitesse en x diminue (équivaut à un déplacement vers la gauche)
    def go_left
      @dernierDeplacement = 'left'
      if contactGauche
           @velocityX = 0
      else
          @velocityX -= 0.5
      end
      @image = @images[0]
    end

    # vitesse en x augmente (équivaut à un déplacement vers la droite)
    def go_right
      @dernierDeplacement = 'right'
      if contactDroit
          @velocityX = 0
      else
          @velocityX += 0.5
      end
      @image = @images[1]
    end

    def mouvement
    end

    # vitesse en y diminue (équivaut à un déplacement vers le haut)
    def go_up
    end

    # vitesse en y augmente (équivaut à un déplacement vers le bas)
    def go_down
    end
    # modification des coordonées du héros
    def move
      @x += @velocityX
      #@x %= WindowSize::Width
      @y += @velocityY
      @y %= NbCarre::Height*Carr::Height
      @velocityX *= 0.96
      if @velocityY>1
        @velocityY *= 0.6
      end
    end

    def attaque1
    end

    def attaque2
    end

    def incremente
    end

    def setTemps (temps)
    end

    def position(map)
      if contactBas
          # puts "down"
           return 'down'
      end
      if contactDroit
           return 'right'
      end
      if contactGauche
           return 'left'
      end
      return 'rien'
    end

    def sol
        if contactBas
          @velocityY = 0
        end
    end

    def tjVivant (tirs)
    end

    def collide?(item)
    end

    def update
    end

    #en contact a quelque chose (objet et non map)
      def enContact(item)
        distance = Gosu::distance(@x,@y,item.x, item.y)
        if distance<35
          @pv -= 1
        end
      end

      def enContactCarre(i,j)
        point = coodonees(i,j)
        pointBas = bg
        distance = Gosu::distance(pointBas[0],pointBas[1],point[0], point[1])
        if distance<35
          return true
        else
          return false
        end
      end
      #methodes qui renvoie un boulean pour dire si le cote choisi touche un carré
           def contactBas
                p1= self.bg
                p2 = self.bd
                pm = pointMid(p1[0],p1[1],p2[0],p2[1])
                if self.carre(p1[0],p1[1]) || self.carre(p2[0],p2[1]) || self.carre(pm[0],pm[1])
                     return true
                else
                     return false
                end
           end

           def getContactBas
             p1= self.bg
             p2 = self.bd
             pm = pointMid(p1[0],p1[1],p2[0],p2[1])
             if self.carre(p1[0],p1[1]) || self.carre(p2[0],p2[1]) || self.carre(pm[0],pm[1])
                  return
             else
                  return nil
             end
           end

           def contactHaut
                p1= self.hg
                p2 = self.hd
                pm = pointMid(p1[0],p1[1],p2[0],p2[1])
                if self.carre(p1[0]-20,p1[1]-20) || self.carre(p2[0]-20,p2[1]-20) || self.carre(pm[0]-20,pm[1]-20)
                     return true
                else
                     return false
                end
           end

           def contactDroit
                p1= self.bd
                p2 = self.hd
                pm = pointMid(p1[0],p1[1],p2[0],p2[1])
                if self.carre(p1[0]-20,p1[1]-20) || self.carre(p2[0]-20,p2[1]-20) || self.carre(pm[0],pm[1])
                    if (self.carre(p1[0]-20,p1[1]-20) && self.carre(p1[0]-20,p1[1]-20).type== Carr::Portail )|| (self.carre(p2[0]-20,p2[1]-20) && self.carre(p2[0]-20,p2[1]-20).type== Carr::Portail) || (self.carre(pm[0],pm[1]) && self.carre(pm[0],pm[1]).type== Carr::Portail)
                      #portail!!
                      return false
                     else
                       return true
                     end
                else
                     return false
                end
           end

           def contactGauche
                p1= self.hg
                p2 = self.bg
                pm = pointMid(p1[0],p1[1],p2[0],p2[1])
                if self.carre(p1[0]-20,p1[1]-20) || self.carre(p2[0]-20,p2[1]-20) || self.carre(pm[0],pm[1])
                  if (self.carre(p1[0]-20,p1[1]-20) && self.carre(p1[0]-20,p1[1]-20).type== Carr::Portail )|| (self.carre(p2[0]-20,p2[1]-20) && self.carre(p2[0]-20,p2[1]-20).type== Carr::Portail) || (self.carre(pm[0],pm[1]) && self.carre(pm[0],pm[1]).type== Carr::Portail)
                    #portail!!
                    return false
                   else
                     return true
                   end
                else
                     return false
                end
           end

        #methodes pour recuperer les 4 points du hero
        def hg
             point = []
             point.push(@x)
            point.push(@y)

            return point
       end

       def hd
            point = []
            point.push(@x+@image.width)
           point.push(@y)

           return point
      end


       def bg
            point = []
            point.push(@x)
           point.push(@y+@image.height)

           return point
      end
      def bd
           point = []
           point.push(@x+@image.width)
           point.push(@y+@image.height)

           return point
      end
      #methode pour récuperer le carré a partir des coordonnées

           def carre(x,y)
                i = x/Carr::Width
                j = y/Carr::Height
                if @map.list[i]
                  return @map.list[i][j]
                else
                  return nil
                end
           end
      #methode pour avoir les coordonnées a partir de l'emplacement du carré
           def coodonees(i,j)
                point = []
                point.push(i*Carr::Width)
                point.push(j*Carr::Height)
                return point
           end

      #methode pour avoir un point intermédiare
           def pointMid (x1,y1,x2,y2)
                x = (x1 + x2)/2
                y = (y1 + y2)/2
                point = []

                point.push(x)
                point.push(y)
                return point
           end

          def subir(points)
            @pv -= points
          end

          def contactPortail
          end

  end
