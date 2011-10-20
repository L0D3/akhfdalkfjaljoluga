prawn_document (:filename=>"Patentliste.pdf", :page_layout => :landscape, :page_size => "LEGAL") do |pdf|
pdf.font("Times-Roman",  :size => 8)

pdf.repeat :all do                                    
pdf.draw_text "ips-Patentverwaltung/Patentliste ", :at => [pdf.bounds.left, -15]
end



items=@patents.map do |item|
[
(item.internaktenzeichen),
(item.amtlaktenzeichen),
(item.ihrzeichen),
(date(item.anmeldedatum)),
truncate(item.submitter_names_with_anteile, :length=>290),
truncate (item.titel,:length=>28),
(item.status_in_string),
item.lizenzbereitschaft_erklärt?
]
end
colors=["BDBDBD"]
@patents.each do  |p|
colors.push(p.status_in_color2)
end
pdf.table items, :border_style =>:grid,
:row_colors=>colors,
:headers=>["AZ. IPS","AZ. AMTL","AZ. KUNDE","ANMELDEDATUM","ANMELDER","TITEL","STATUS","Lizenzb"],
:column_widths=>{0=>90,1=>120,2=>60,3=>65,4=>300,5=>150,6=>70,7=>60}





end
