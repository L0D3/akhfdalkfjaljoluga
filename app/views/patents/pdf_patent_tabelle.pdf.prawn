prawn_document(:page_layout => :landscape, :page_size => "LEGAL") do |pdf|
pdf.font("Times-Roman",  :size => 8)
items=@patents.map do |item|
[
(item.internaktenzeichen),
(item.amtlaktenzeichen),
(item.ihrzeichen),
(date(item.anmeldedatum)),
(item.submitter_names),
trunc (item.titel),
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
:column_widths=>[30,30,30,30,30,30,30]
end

