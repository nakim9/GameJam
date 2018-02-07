# classe map

class Map
  attr_reader :list , :width
   def initialize()
     @width=000
     @list = Array.new(@width){Array.new(NbCarre::Height,nil)}
     print("\ndebut\n")
     self.creemap()
     self.ecritConsole
  end

  def add(x,y,carre)
      @list[x][y]=carre
  end

  def draw #dessine la map
    i=0
    @list.each do |x|
      j=0
      x.each do |y|
      if y && y.image==Carr::Terre
        Gosu::draw_rect(i*Carr::Width, j*Carr::Height, Carr::Width, Carr::Height,  Gosu::Color.new(255, 255, 0, 0))
      elsif  y && y.image==Carr::Start
        Gosu::draw_rect(i*Carr::Width, j*Carr::Height, Carr::Width, Carr::Height,  Gosu::Color.new(255, 255, 255, 0))
      end
      j=j+1
    end
    i=i+1
    end
  end

  def creemap()
    aleaFloat=2*rand+1
    aleaInt=aleaFloat.round
    self.addMapToList("maps/1/"+ aleaInt.to_s)
      aleaFloat=2*rand+1
      aleaInt=aleaFloat.round
    self.addMapToList("maps/2/"+ aleaInt.to_s)
      aleaFloat=2*rand+1
      aleaInt=aleaFloat.round
    self.addMapToList("maps/3/"+ aleaInt.to_s)
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
              if c!="\n" && c!=Carr::Vide
                newList[x][y]=Carre.new(c)
              elsif c=="\n"
                notfin=false
              end
            end
            x+=1
          end
      end
      aFile.close
      @list=newList
      @width=taille
    end
    end

    def ecritConsole
      for y in 0..NbCarre::Height-1
        for x in 0..@width-1
          if @list[x][y] && @list[x][y].image==Carr::Terre
            print("T")
          elsif @list[x][y] &&  @list[x][y].image==Carr::Start
            print("S")
          else
            print("O")
          end
        end
        print("\n")
      end
    end
end

=begin
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
        if c!="\n" && c!=Carr::Vide
          self.add(x,y,Carre.new(c))
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
      if @list[x][y]
        aFile.syswrite(@list[x][y].image)
      else
        aFile.syswrite("O")
      end
    end
    aFile.syswrite("\n")
  end
      aFile.close
  end

def creeMap()
  self.addMapToList("maps/test")

  aleaFloat=2*rand
  aleaInt=aleaFloat.round
  self.addMapToList("maps/1/1")

  aleaFloat=2*rand
  aleaInt=+aleaFloat.round
  self.addMapToList("maps/2/"+aleaInt.to_s)
  aleaFloat=2*rand
  aleaInt=+aleaFloat.round
  self.addMapToList("maps/3/"+aleaInt.to_s)

end
=end
