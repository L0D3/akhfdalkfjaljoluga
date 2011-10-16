module PatentsHelper
  def brief_schriftgröße pdf
    pdf.font ("Times-Roman",:size=>10) 
  end
  def warning_box (pdf,text1,text2)
pdf.bounding_box [300,614], :width => 230 do
    pdf.font ("Times-Roman",:size=>14) do
      pdf.draw_text  (text1,:style=>:bold, :at=>[(pdf.bounds.left+10),pdf.bounds.left-20])
      pdf.draw_text  (text2,:style=>:bold, :at=>[(pdf.bounds.left+10),pdf.bounds.left-35])
    end
    pdf.move_down 50
    pdf.stroke do
      pdf.line pdf.bounds.top_left,    pdf.bounds.top_right
      pdf.line pdf.bounds.bottom_left, pdf.bounds.bottom_right
      pdf.line pdf.bounds.top_left, pdf.bounds.bottom_left
      pdf.line pdf.bounds.top_right, pdf.bounds.bottom_right
    end
 end 
  end
  def warning_box2(pdf,text1,text2,text3)
pdf.bounding_box [300,614], :width => 230 do
    pdf.font ("Times-Roman",:size=>12) do
      pdf.draw_text  (text1,:style=>:bold, :at=>[(pdf.bounds.left+10),pdf.bounds.left-15])
      pdf.draw_text  (text2,:style=>:bold, :at=>[(pdf.bounds.left+10),pdf.bounds.left-30])
      pdf.draw_text  (text3,:style=>:bold, :at=>[(pdf.bounds.left+10),pdf.bounds.left-45])
    end
    pdf.move_down 53
    pdf.stroke do
      pdf.line pdf.bounds.top_left,    pdf.bounds.top_right
      pdf.line pdf.bounds.bottom_left, pdf.bounds.bottom_right
      pdf.line pdf.bounds.top_left, pdf.bounds.bottom_left
      pdf.line pdf.bounds.top_right, pdf.bounds.bottom_right
    end
 end
  end
  def betreff (pdf, text)
    pdf.text_box text, :style=>:bold,
      :width    => 400, :height => pdf.font.height * 7,
      :overflow => :ellipses, 
      :at       => [20,475],
      :inline_format=>true
  end
  def betreff2 (pdf,text)
    pdf.bounding_box [20,475], :width=>400 do
       pdf.text text, :inline_format=>true ,:style=>:bold,:height => pdf.font.height * 7
    end
  end
  def anschreiben (pdf, text)
    pdf.bounding_box [20,408], :width => 500 do
       pdf.font ("Times-Roman",:size=>10) do
       pdf.text  "Sehr geehrte Damen und Herren,"
       pdf.move_down 7
       pdf.text text, :inline_format=>true 
       end
     end
    pdf.bounding_box [80,162], :width => 50  do
       pdf.move_down 10
       pdf.text "Ort, Datum"
       pdf.stroke do
       pdf.line pdf.bounds.top_left,    pdf.bounds.top_right
       end
       end
    pdf.bounding_box [180,162], :width => 100  do
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
  end
  def checkbox_1 pdf
    pdf.bounding_box [100,211], :width => 8 ,:height=>8 do
      pdf.stroke do
        pdf.line pdf.bounds.top_left,    pdf.bounds.top_right
        pdf.line pdf.bounds.bottom_left, pdf.bounds.bottom_right
        pdf.line pdf.bounds.top_left, pdf.bounds.bottom_left
        pdf.line pdf.bounds.top_right, pdf.bounds.bottom_right
      end
    end
    pdf.bounding_box [120,211], :width =>500 do
      pdf.text "Ja, bitte veranlassen Sie für obiges Schutzrecht die Einzahlung der nächsten Jahresgebühr."
      end
    end
  def checkbox_2 pdf
    pdf.bounding_box [100,198], :width => 8 ,:height=>8 do
      pdf.stroke do
        pdf.line pdf.bounds.top_left,    pdf.bounds.top_right
        pdf.line pdf.bounds.bottom_left, pdf.bounds.bottom_right
        pdf.line pdf.bounds.top_left, pdf.bounds.bottom_left
        pdf.line pdf.bounds.top_right, pdf.bounds.bottom_right
       end
      end

    pdf.bounding_box [120,198], :width =>500 do
      pdf.text "Nein, bitte stellen Sie die administrative Überwachung für das obige Schutzrecht ein."
    end
  end
def betreff_patentanfrage pdf
 betreff(pdf,
  "Überwachungsanfrage für ihre Patentanmeldung " +@patent.amtlaktenzeichen+" vom "+@patent.anmeldedatum.strftime("%d.%m.%Y")+"
 Anmelder: "+@patent.submitter_names+"
 "+'"'+@patent.titel+'"'
 )
end
def rechnung(pdf, part1,part2,part3)
  pdf.bounding_box [20,408], :width => 500 do
    pdf.font ("Times-Roman",:size=>10) do
      pdf.text  "Sehr geehrte Damen und Herren,"
      pdf.move_down 7
      pdf.text part1, :inline_format=>true 
    end
    if @patent.submissions.size >1
      pdf.font ("Times-Roman",:size=>10) do
        pdf.text part2, :inline_format=>true 
      end
      pdf.move_down 7
    pdf.font ("Times-Roman",:size=>7) do
      items=@patent.submissions.map do |item|
        [
          item.submitter.name,
          item.anteil.to_s+'%',
        ]
      end


      pdf.table items, :border_style =>:grid,
        :font_size=>9,
        :borders=>[:zero,:top,:zero,:zero],
        :border_width =>1
      pdf.move_down @patent.submitters.size*7
    end
    end
    pdf.font ("Times-Roman",:size=>10) do
      pdf.text part3, :inline_format=>true 
    end
  end
end
end
