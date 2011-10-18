
class Patent < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
#    validates_presence_of  :Lizenzbereitschaft,  :amtlAktenzeichen, :internAktenzeichen, :Titel 
  after_create { 
    Patent.where('anmeldedatum_month is null').each do |u|
    u.anmeldedatum_month = u.anmeldedatum.month
    u.anmeldedatum_day = u.anmeldedatum.day
    u.save
  end
}


  def update_anmeldedatum_fields
    self.anmeldedatum_month=19
    self.anmeldedatum_day=self.anmeldedatum.day
  end
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
    else 
      date=Date.new(Date.today.year,self.anmeldedatum.month,anmeldedatum.day).end_of_month
      if date<Date.today and (status_in_string=="aktiv" or status_in_string=="inaktiv")
        date=Date.new(Date.today.year+1,self.anmeldedatum.month,anmeldedatum.day).end_of_month
      end
      return date
    end
  end

  def lizenzbereitschaft?
  if lizenzbereitschaft
    return "erteilt"
  else
    return "nicht erteilt"
  end
  end
 
  def sort_by_fälligkeit
    if gebührenfälligkeit>=Date.today
      gebührenfälligkeit
      else gebührenfälligkeit.years_since(1)
      end
  end
  #das ist die Frist 
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
  def submitter_names_with_anteile
    submissions.all.map{|s| s.submitter.name+"("+s.anteil.to_s+")" }.join('; ')
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
  def preis(s)
    if s.nil? or s.anteil.blank?
    preis_für_jahr
    else 
    preis_für_jahr.to_f*0.01*s.anteil 
  end
  end

  def prioritätsfrist
  end

  def prüfungsantragsfrist
  end

  def jahresgebühr
    jahresgebühr=0
    if  gebührenfälligkeit.year-1-self.anmeldedatum.year >0
      then  jahresgebühr=gebührenfälligkeit.year+1-self.anmeldedatum.year 
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
  def submitter_names_for_table
    submissions.all.map{|s| truncate(s.submitter.name,:length=>20)+"("+s.anteil.to_s+")" }.join('; ')
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

