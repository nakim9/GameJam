# classe map

class Map
  attr_reader :list , :width
   def initialize(name)
     @width=000
     @list = Array.new(@width){Array.new(NbCarre::Height,nil)}
     self.addMapToList(name)

  end

  def add(x,y,carre)
      @list[x][y]=carre

  end

  def draw #dessine la map
    i=0
    @list.each do |x|
      j=0
      x.each do |y|
        if y
      Gosu::draw_rect(i*Carr::Width, j*Carr::Height, Carr::Width, Carr::Height,  Gosu::Color.new(255, 255, 0, 0))
      end
      j=j+1
    end
    i=i+1
    end
  end

  def lectureMap(name)#lit la map name et l implemente dans @list
    if File::exists?( name )
      aFile=File.open(name,"r")
      centaine=aFile.sysread(1)
      disaine=aFile.sysread(1)
      uniter=aFile.sysread(1)
      @width=centaine.to_i*100+disaine.to_i*10+uniter.to_i
      @list = Array.new(@width){Array.new(NbCarre::Height,nil)}
      aFile.sysread(1)
      for y in 0..NbCarre::Height-1
        x=0
        notfin=true
        while notfin
          c=aFile.sysread(1)
          if c==Carr::Terre
            self.add(x,y,Carre.new(1))
          elsif c=="\n"
            notfin=false
          else
            self.add(x,y,nil)
          end
          x+=1
        end
      end
      aFile.close
    end
  end

  def creationFil(name)#sauve garde la map dans creation pour la metre dans un fichier name
    aFile=File.new(name,"w")
    if @width>99
      aFile.syswrite()
    elsif @width>9
      aFile.syswrite(0)
      aFile.syswrite(@width)
    else
      aFile.syswrite(0)
      aFile.syswrite(0)
      aFile.syswrite(@width)
    end
    aFile.syswrite("\n")
    for y in 0..NbCarre::Height-1
      for x in 0..@width-1
        if @list[x][y]==Carr::Terre
          aFile.syswrite(Carr::Terre)
        else
          aFile.syswrite(Carr::Vide)
        end
      end
      aFile.syswrite("\n")
    end
        aFile.close
    end


    def addMapToList(name)
      if File::exists?( name )
        aFile=File.open(name,"r")
        centaine=aFile.sysread(1)
        disaine=aFile.sysread(1)
        uniter=aFile.sysread(1)
        taille=centaine.to_i*100+disaine.to_i*10+uniter.to_i
        taille+=@width
        newList = Array.new(taille){Array.new(NbCarre::Height,nil)}
        aFile.sysread(1)
        for y in 0..NbCarre::Height-1
          x=0
          notfin=true
          while notfin
            if x<@width
              newList[x][y]=@list[x][y]
            else
              c=aFile.sysread(1)
              if c==Carr::Terre
                newList[x][y]=Carre.new(Carr::Terre)
              elsif c==Carr::Start
                newList[x][y]=Carre.new(Carr::Start)
              elsif c=="\n"
                notfin=false
              else
                  newList[x][y]=nil
              end
            end
            x+=1
          end
      end

      aFile.close
      @list=newList
    end
    end

    def creeMap()
      self.addMapToList("maps/test")
=begin
      aleaFloat=2*rand
      aleaInt=+aleaFloat.round
      self.addMapToList("maps/1/"+aleaInt.to_s)

      aleaFloat=2*rand
      aleaInt=+aleaFloat.round
        self.addMapToList("maps/2/"+aleaInt.to_s)
=end
    end

end
