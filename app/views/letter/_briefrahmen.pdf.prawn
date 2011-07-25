ppdf.font("Times-Roman",  :size => 10)
ppdf.fill_rectangle [10,750], 10, 10 
ppdf.fill_rectangle [25,750], 10, 10 
ppdf.fill_rectangle [40,750], 10, 10 
pigs = "#{RAILS_ROOT}/public/images/logo.png" 
ppdf.image pigs, :at => [380,750], :scale => 0.3

 ppdf.bounding_box [20,665], :width => 300 do
    ppdf.font ("Times-Roman",:size=>9) do
      ppdf.text  "<u>ips, Großwaldstraße 31, 66571 Eppelborn</u>", :inline_format=>true
    end
    ppdf.font("Times-Roman",:size=>13) do
      ppdf.text  "Patentverwertungsagentur
      Campus Universität
      66123 Saarbrücken

      <u>Per Fax an 06819386903</u>",:inline_format=>true
    end
 end

 ppdf.bounding_box [20,525], :width => 300 do
      ppdf.text "Ihr Zeichen"
    ppdf.font ("Times-Roman",:size=>10) do
      ppdf.text "<b>"+@patent.ihrzeichen+"</b>",:inline_format => true
    end
  end 

 ppdf.bounding_box [200,525], :width => 300 do
    ppdf.text "Unser Zeichen"
    ppdf.font ("Times-Roman",:size=>9) do
      ppdf.text "<b>"+@patent.internaktenzeichen+"</b>",:inline_format => true
    end
 end

 ppdf.bounding_box [380,525], :width => 300 do
    ppdf.text "Datum"
    ppdf.font ("Times-Roman",:size=>9) do
      ppdf.text "<b>"+Time.now.strftime("%d.%m.%Y")+"</b>",:inline_format => true
    end
 end


ppdf.fill_color "D0D0D0"
ppdf.fill_rectangle [20,52], 503, 52 
ppdf.fill_color "000000"
 ppdf.bounding_box [23,49], :width =>250 do
   ppdf.font ("Times-Roman",:size=>9) do
      ppdf.text "ips UG (haftungsbeschränkt)
   Wilhelm Lahann (Geschäftsführer)
   Großwaldstraße 31, 66571 Eppelborn
   Bank1Saar, BLZ 59190000, Konto 111626006
   Ust.ID.:030/111/01126"
   end
  end

ppdf.bounding_box [420,49], :width =>250 do
   ppdf.font ("Times-Roman",:size=>9) do
   ppdf.text "Tel./Fax 06881 962256
   wilhelm.lahann@ips-ug.de
   Sitz Eppelborn/Habach
   HRB 18595"
   end
  end
