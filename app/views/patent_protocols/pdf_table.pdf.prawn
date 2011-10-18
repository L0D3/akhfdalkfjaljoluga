prawn_document(:filename=>"TransaktionsListe.pdf",:page_layout=>:landscape,:page_size => "LEGAL") do |pdf|
pdf.font("Times-Roman",  :size => 8) do
pdf.repeat :all do                                    
pdf.draw_text "ips-Patentverwaltung/Transaktionsliste", :at => [pdf.bounds.left, -15]
end
end

items=@p.map do |item|
[
date(item.time),
item.patent.internaktenzeichen,
trunc(item.patent.titel),
item.comment
]
end
colors=["BDBDBD"]
@p.each do  |p|
colors.push("FFFFFF")
end

pdf.table items, :border_style =>:grid,
:row_colors=>colors,
:headers =>["Datum","Patent","Titel der Anmeldung","Transaktion"]


end
