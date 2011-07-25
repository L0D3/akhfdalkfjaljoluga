#Variables
#amtlZeichen=@patent.amtlaktenzeichen
#unserZeichen=@patent.internaktenzeichen
#Titel=@patent.titel
#aktuellesDatum=Time.now.strftime("%d.%B %Y")
#Anmelder=@patent.anmelder.name
#Jahr=@patent.jahr
#Kosten=@patent.kosten
#Erinnerung=@patent.berechne_erinnerung
#Fälligkeit=@patent.gebührenfälligkeit.strftime("%d.%m.%y")


pdf.font("Times-Roman",  :size => 11)
pdf.fill_rectangle [10,750], 10, 10 
pdf.fill_rectangle [25,750], 10, 10 
pdf.fill_rectangle [40,750], 10, 10 
pigs = "#{RAILS_ROOT}/public/images/logo.png" 
pdf.image pigs, :at => [380,750], :scale => 0.3

 pdf.bounding_box [20,670], :width => 300 do
    pdf.font ("Times-Roman",:size=>9) do
      pdf.text  "<u>ips, Großwaldstraße 31, 66571 Eppelborn</u>", :inline_format=>true
    end
    pdf.font("Times-Roman",:size=>14) do
      pdf.text  "Patentverwertungsagentur
      Campus Universität 66123 Saarbrücken

      Per Fax an 0681 9386903"
    end
 end

pdf.bounding_box [300,614], :width => 230 do
    pdf.font ("Times-Roman",:size=>12) do
      pdf.draw_text  ("Erste Erinnerung!",:style=>:bold, :at=>[(pdf.bounds.left+10),pdf.bounds.left-15])
      pdf.draw_text  ("FRISTSACHE! Rechtsverfall droht!",:style=>:bold, :at=>[(pdf.bounds.left+10),pdf.bounds.left-30])
      pdf.draw_text  ("Zurück per Fax an 06881 962256",:style=>:bold, :at=>[(pdf.bounds.left+10),pdf.bounds.left-45])
    end
    pdf.move_down 53
    pdf.stroke do
      pdf.line pdf.bounds.top_left,    pdf.bounds.top_right
      pdf.line pdf.bounds.bottom_left, pdf.bounds.bottom_right
      pdf.line pdf.bounds.top_left, pdf.bounds.bottom_left
      pdf.line pdf.bounds.top_right, pdf.bounds.bottom_right
    end
 end
  pdf.bounding_box [20,555], :width => 300 do
      pdf.text "Ihr Zeichen"
    pdf.font ("Times-Roman",:size=>11) do
      pdf.text "<b>"+@patent.ihrzeichen+"</b>",:inline_format => true
    end
  end 

 pdf.bounding_box [200,555], :width => 300 do
    pdf.text "Unser Zeichen"
    pdf.font ("Times-Roman",:size=>9) do
      pdf.text "<b>"+@patent.internaktenzeichen+"</b>",:inline_format => true
    end
 end

 pdf.bounding_box [380,555], :width => 300 do
    pdf.text "Datum"
    pdf.font ("Times-Roman",:size=>9) do
      pdf.text "<b>"+Time.now.strftime("%d.%m.%Y")+"</b>",:inline_format => true
    end
 end


 pdf.text_box  "Erste Überwachungserinnerung für ihre Patentanmeldung " +@patent.amtlaktenzeichen+" 
 Anmelder: "+@patent.inventor_names+"
 "+@patent.titel, :style=>:bold,
 :width    => 400, :height => pdf.font.height * 7,
    :overflow => :ellipses, 
    :at       => [20,505]



 pdf.bounding_box [20,450], :width => 500 do
  pdf.text  "Sehr geehrte Damen und Herren,"
pdf.move_down 13
pdf.text "zur Aufrechterhaltung Ihres obigen Schutzrechtes wird am "+@patent.gebührenfälligkeit.strftime("%d.%m.%Y")+" die "+@patent.jahresgebühr+". Jahresgebühr in Höhe von "+@patent.preis+",00 € fällig."
pdf.move_down 8
pdf.text "Nach Ablauf dieser Frist ist für ein Zeitraum von sechs Monaten eine Nachzahlung der Gebühr zzgl. eines Verspätungszuschlages in Höhe von 50% der jeweils fälligen Jahresgebühr noch möglich, ohne einen Rechtsverlust zu erleiden. Nach Ablauf dieser Frist verfällt die Anmeldung."
pdf.move_down 8
pdf.text "Sollten Sie die Anmeldung aufgeben wollen, ist diese, soweit das Schutzrecht auf eine unbeschränkt in Anspruch genommene Diensterfindung zurückgeht und die Vergütungsansprüche der Erfinder gemäß Arbeitnehmererfindergesetz nicht abgegolten sind, den Erfindern spätestens zwei Monate vor dem drohenden Rechtsverlust anzubieten."
pdf.move_down 8
pdf.text "Bitte teilen Sie uns bis zum <u>"+@patent.ersteerinnerung.strftime("%d.%m.%Y")+"</u> durch Ankreuzen Ihrer Aufrechterhaltungsentscheidung, Unterschrift und Rückübersendung dieses Schreibens an obige Faxnummer verbindlich mit, ob Sie obiges Schutzrecht aufrecht erhalten wollen und ob wir die Einzahlung der nächsten Gebühr für Sie veranlassen sollen.",
    :inline_format=>true 
end


 
 pdf.bounding_box [100,232], :width => 10 ,:height=>10 do
    pdf.stroke do
      pdf.line pdf.bounds.top_left,    pdf.bounds.top_right
      pdf.line pdf.bounds.bottom_left, pdf.bounds.bottom_right
      pdf.line pdf.bounds.top_left, pdf.bounds.bottom_left
      pdf.line pdf.bounds.top_right, pdf.bounds.bottom_right
    end
 end
  pdf.bounding_box [120,232], :width =>500 do
      pdf.text "Ja, bitte veranlassen Sie für obiges Schutzrecht die Einzahlung der nächsten Jahresgebühr."
  end

 pdf.bounding_box [100,215], :width => 10 ,:height=>10 do
    pdf.stroke do
      pdf.line pdf.bounds.top_left,    pdf.bounds.top_right
      pdf.line pdf.bounds.bottom_left, pdf.bounds.bottom_right
      pdf.line pdf.bounds.top_left, pdf.bounds.bottom_left
      pdf.line pdf.bounds.top_right, pdf.bounds.bottom_right
    end
 end

  pdf.bounding_box [120,215], :width =>500 do
  pdf.text "Nein, bitte stellen Sie die administrative Überwachung für das obige Schutzrecht ein."
 end

 pdf.bounding_box [80,170], :width => 50  do
    pdf.move_down 10
    pdf.text "Ort, Datum"
    pdf.stroke do
      pdf.line pdf.bounds.top_left,    pdf.bounds.top_right
    end
 end
 
 pdf.bounding_box [180,170], :width => 100  do
    pdf.move_down 10
    pdf.text "Stempel,Unterschrift"
    pdf.stroke do
      pdf.line pdf.bounds.top_left,    pdf.bounds.top_right
    end
 end

 pdf.bounding_box [20,120], :width =>200 do
   pdf.text "Mit freundlichen Grüßen"
   pdf.move_down 20
   pdf.text "Wilhelm Lahann
   Geschäftsführer"
  end

pdf.fill_color "D0D0D0"
pdf.fill_rectangle [20,52], 503, 52 
pdf.fill_color "000000"
 pdf.bounding_box [23,49], :width =>250 do
   pdf.font ("Times-Roman",:size=>9) do
      pdf.text "ips UG (haftungsbeschränkt)
   Wilhelm Lahann (Geschäftsführer)
   Großwaldstraße 31, 66571 Eppelborn
   Bank1Saar, BLZ 59190000, Konto 111626006
   Ust.ID.:030/111/01126"
   end
  end

pdf.bounding_box [420,49], :width =>250 do
   pdf.font ("Times-Roman",:size=>9) do
   pdf.text "Tel./Fax 06881 962256
   wilhelm.lahann@ips-ug.de
   Sitz Eppelborn/Habach
   HRB 18595"
   end
  end
