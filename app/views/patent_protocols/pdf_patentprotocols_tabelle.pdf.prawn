prawn_document(:page_layout=>:landscape,:page_size => "LEGAL") do |pdf|
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
