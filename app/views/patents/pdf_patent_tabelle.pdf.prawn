prawn_document (:filename=>"Patentliste.pdf", :page_layout => :landscape, :page_size => "LEGAL") do |pdf|
pdf.font("Times-Roman",  :size => 8)

pdf.font("Times-Roman",  :size => 12) do
pdf.number_pages "<page> of  <total>", :at => [pdf.bounds.right - 100,-15],
                                    :page_filter => :all
pdf.repeat :all do                                    
pdf.draw_text "ips-Patentverwaltung ", :at => [pdf.bounds.left, -15]
end
end



items=@patents.map do |item|
[
(item.internaktenzeichen),
(item.amtlaktenzeichen),
(item.ihrzeichen),
(date(item.anmeldedatum)),
truncate(item.submitter_names_with_anteile, :length=>290),
truncate (item.titel,:length=>100),
(item.status_in_string)
]
end
colors=["BDBDBD"]
@patents.each do  |p|
colors.push(p.status_in_color2)
end
pdf.table items, :border_style =>:grid,
:row_colors=>colors,
:headers=>["AZ. IPS","AZ. AMTL","AZ. KUNDE","ANMELDEDATUM","ANMELDER","TITEL","STATUS"],
:column_widths=>{0=>90,1=>120,2=>60,3=>90,4=>310,5=>210,6=>80}





end
