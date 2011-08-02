class Patent < ActiveRecord::Base
#    validates_presence_of  :Lizenzbereitschaft,  :amtlAktenzeichen, :internAktenzeichen, :Titel 
  
  search_methods :gebührenfälligkeit


  def date string
    Date.strptime(string,'%d/%m/%y')
  end


  has_many :procurations
  has_many :bills
  has_many :inventions
  has_many :submissions
  has_many :patent_protocols
  has_many :procurators,    :through => :procurations#Vertreter
  has_many :inventors,      :through => :inventions #Erfinder
  has_many :submitters,     :through => :submissions#Anmelder
  def gebührenfälligkeit  
    if self.anmeldedatum.years_since(2) >Date.today
      then self.anmeldedatum.years_since(2).end_of_month
    else  Date.new(Date.today.year,self.anmeldedatum.month,anmeldedatum.day).end_of_month
    end
  end
  def sort_by_fälligkeit
    if gebührenfälligkeit>=Date.today
      gebührenfälligkeit
      else gebührenfälligkeit.years_since(1)
      end
  end
  def ersteerinnerung
  self.gebührenfälligkeit.beginning_of_month.advance(:days=>14)
  end
  def anfrage
  self.gebührenfälligkeit.prev_month.beginning_of_month.advance(:days=>14)
  end
 
  def inventor_names
    inventors.find(:all,:select=>"name").map(&:name).join('; ')
  end
  def inventor_names=(names)
    inventors.clear
    names.split(';').each do|h|
      user= User.find_or_create_by_name(h)
      inventors << user unless inventors.include? user 
    end
  end 
  def submitter_names
    submitters.find(:all,:select=>"name").map(&:name).join('; ')
  end
  def submitter_names=(names)
    submitters.clear
    names.split(';').each do|h|
      user= User.find_or_create_by_name(h)
      submitters<< user unless submitters.include? user 
    end
  end 
  def procurator_names
    procurators.find(:all,:select=>"name").map(&:name).join('; ')
  end
  def procurator_names=(names)
    procurators.clear
    names.split(';').each do|h|
      user= User.find_or_create_by_name(h)
      procurators << user unless procurators.include? user 
    end
  end 
   
  def zweiteerinnerung
  self.gebührenfälligkeit.beginning_of_month.advance(:days=>14)
  end
  def berechne_Erinnerung
     if(Date.today>ersteerinnerung)
       return zweiteerinnerung
     else return ersteerinnerung
     end
  end

  def verspätungsgebühr
    self.gebührenfälligkeit.months_since(2) 
  end
  def rechtsverlust
    self.gebührenfälligkeit.months_since(6)
  end
  def überwachungsanfrage
      self.gebührenfälligkeit.months_ago(3)
  end
  def preis
    preis=case nationalität
    when "Europa" then eu_preis
    when "Deutschland" then de_preis
    else -1
  end
  end

  def prioritätsfrist
  end

  def prüfungsantragsfrist
  end

  def jahresgebühr
    jahresgebühr=0
    if  Date.today.year-1-self.anmeldedatum.year >0
      then  jahresgebühr=Date.today.year+1-self.anmeldedatum.year 
    end
    jahresgebühr.to_s
  end
def status_in_string
 case self.status
 when 1
   return "aktiv"
 when 2
   return "Anfrage"
 when 3
   return "1 Erinnerung"
 when 4
   return "2. Erinnerung"
 when 5
   return "Rechnung gestellt"
 when 6
   return "Jahresgebühr zu veranlassen"
 else
   return "inaktiv"
 end
end
def status_in_color
case self.status
 when 1
   return "white"
 when 2
   return "green"
 when 3
   return "green"
 when 4
   return "green"
 when 5
   return "green"
 when 6
   return "green"
 else
   return "white"
 end
end
def status_in_color2
case self.status
 when 1
   return "FFFFFF"
 when 2
   return "81F781"
 when 3
   return "81F781"
 when 4
   return "81F781"
 when 5
   return "81F781"
 when 6
   return "81F781"
 else
   return "FFFFFF"
 end
end

def letzte_änderung
  p=patent_protocols.find(:last)
  p.time unless p.nil?
end
 private
 def eu_preis
   preis_für_jahr
 end
 def de_preis
   preis_für_jahr
 end
 def preis_für_jahr
     fee=Fee.find_by_country(nationalität)
     if fee.nil?
       return "Preis für "+jahresgebühr+" nicht definiert!"
     end
     if jahresgebühr=="0"
        "-1"
     else
        if fee.send("year_"+jahresgebühr).nil?
          "Preis für "+jahresgebühr+" nicht definiert!"
        else
        fee.send("year_"+jahresgebühr).to_s
        end
     end 
 end

end 

