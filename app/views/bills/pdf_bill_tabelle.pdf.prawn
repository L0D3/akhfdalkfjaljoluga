prawn_document(:page_size => "LEGAL") do |pdf|

items=@bills.map do |item|
[
date(item.datum),
date(item.rechnungsdatum),
item.patent.internaktenzeichen,
item.rechnungsnummer,
]
end
colors=["BDBDBD"]
@bills.each do  |p|
colors.push("FFFFFF")
end

pdf.table items, :border_style =>:grid,
:row_colors=>colors,
:headers =>["Bezugsdatum","Rechnungsdatum","Patent","Rechnungsnummer"]


end
