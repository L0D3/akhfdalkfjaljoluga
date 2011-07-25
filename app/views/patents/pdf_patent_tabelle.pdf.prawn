prawn_document(:page_layout => :landscape, :page_size => "LEGAL") do |pdf|

items=@patents.map do |item|
[
item.internaktenzeichen,
item.amtlaktenzeichen,
item.ihrzeichen,
item.anmeldedatum,
item.submitter_names,
item.inventor_names,
item.status_in_string
]
end
colors=["BDBDBD"]
@patents.each do  |p|
colors.push(p.status_in_color2)
end
pdf.table items, :border_style =>:grid,
:row_colors=>colors,
:headers =>["Az. ips","Az. amtl.","Az. Kunde","Anmeldedatum","Anmelder","Erfinder","Zustand"]


end
