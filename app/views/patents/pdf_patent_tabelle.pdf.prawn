prawn_document(:page_layout => :landscape, :page_size => "LEGAL") do |pdf|
pdf.font("Times-Roman",  :size => 8)
items=@patents.map do |item|
[
fu(item.internaktenzeichen),
fu(item.amtlaktenzeichen),
fu(item.ihrzeichen),
fu(date(item.anmeldedatum)),
fu(item.submitter_names),
trunc (item.titel),
fu(item.status_in_string)
]
end
colors=["BDBDBD"]
@patents.each do  |p|
colors.push(p.status_in_color2)
end
pdf.table items, :border_style =>:grid,
:row_colors=>colors,
:headers=>["AZ. IPS","AZ. AMTL","AZ. KUNDE","ANMELDEDATUM","ANMELDER","TITEL","STATUS"],
end

