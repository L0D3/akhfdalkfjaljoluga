
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


 pdf.text_box RECHNUNGSNUMMER
 Rechnung "+@patent.jahresgebühr+"für ihre Patentanmeldung " +@patent.amtlaktenzeichen+" 
 Anmelder: "+@patent.inventor_names+"
 "+@patent.titel, :style=>:bold,
 :width    => 400, :height => pdf.font.height * 7,
    :overflow => :ellipses, 
    :at       => [20,505]



 pdf.bounding_box [20,450], :width => 500 do
  pdf.text  "Sehr geehrte Damen und Herren,"
pdf.move_down 13
pdf.text "mit Aufrechterhaltungsentscheidung vom "+@patent.aufrechterhaltungsentscheidung+"haben Sie uns beauftragt, für Ohre obige Patentanmeldung die "+@patent.jahresgebühr+". Jahresgebühr in Höhe von "+@patent.preis+",00 € einzuzahlen. Wir werden die Einzahlung beim Europäischen Patentamt fristgerecht vornehmen."
pdf.move_down 13
pdf.text "Zur Erstattung unserer Auslagen bitten wir um Überweisung von <b> "+@patent.preis+",00 €</b> unter Angabe unseres Zeichens und der Rechnungsnummer <u>RECHNUNGSNUMMER</u> auf unser untenstehendes Kondo.",
  :inline_format=>true
end
pdf.move_down 13
pdf.text "Einzahlbar innerhalb von 30 Tagen ohne Abzug.


Für Rückfragen stehen wir gerne zur Verfügung.


Mit freundlichen Grüßen
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
      pdf.text "Ja bitte veranlassen Sie für obiges Schutzrecht die Einzahlung der nächsten Jahresgebühr."
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
      pdf.text "Ja bitte veranlassen Sie für obiges Schutzrecht die Einzahlung der nächsten Jahresgebühr."
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
