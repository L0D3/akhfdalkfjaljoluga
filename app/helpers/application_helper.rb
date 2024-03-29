# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def sortable (column, title=nil)
    title ||=column.titleize
    direction=column== params[:sort]&&params[:direction] == "asc"  ?  "desc" : "asc"
    link_to title, :sort => column, :direction =>direction
  end
  def status_hash
{"aktiv"=>1, "Anfrage"=>2, "1.Erinnerung"=>3, "2.Erinnerung"=>4, "Rechnung gestellt"=>5, "Jahresgebühr zu veranlassen"=>6, "inaktiv"=>7}.sort{|a,b| a[1]<=>b[1]}
  end
  def date date
    date.strftime("%d.%m.%Y") unless date.nil?
  end
  def string_to_date string
    Date.strptime(string,'%d.%m.%y')
  end
  def trunc string
    if string.nil?
      return ""
    else
    return truncate (string,:length=>20)+"..." 
    end
  end
  def fu s
    if s.nil?
      return ""
    else
      s
    end
  end
end
