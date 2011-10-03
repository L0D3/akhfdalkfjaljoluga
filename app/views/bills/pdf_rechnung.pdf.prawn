render :partial=>'letter/rechnungsrahmen.pdf.prawn',:locals=>{:ppdf=>pdf}
brief_schriftgröße(pdf)

betreff2 (pdf,"<u>"+@rechnungsnummer+"</u>
Rechnung "+@patent.jahresgebühr+". Jahresgebühr für Ihre Patentanmeldung "+@patent.amtlaktenzeichen+" vom "+@patent.anmeldedatum.strftime("%d.%m.%Y")+"
Anmelder: "+@patent.submitter_names+'
"'+@patent.titel+'"')



rechnung (pdf,"
mit Schreiben vom "+@datum.strftime("%d.%m.%Y")+" haben Sie uns beauftragt, für Ihre obige Patentanmeldung die "+@patent.jahresgebühr+". Jahresgebühr in Höhe von "+@patent.preis+",00 €  beim zuständigen Patentamt einzuzahlen.

Wir werden die Einzahlung fristgemäß vornehmen.

if @patent.submitters.size>1
  "An diesem Schutzrecht besteht folgende Anteilssituation, nach der sich auch die Kostentragungspflicht regelt:
"

@patent.submissions do |s|
s.submitter.name
s.anteil
end
"
end
"Zur Erstattung unserer Auslagen bitten wir um Überweisung von "+@patent.rechnungs_preis+",00 € unter Angabe unseres Zeichens und der Rechnungsnummer "+@rechnungsnummer+" auf unser untenstehendes Konto.


Zahlbar innerhalb von 30 Tagen ohne Abzug.



Für Rückfragen stehen wir gerne zur Ihrer Verfügung


Mit freundlichen Grüßen.



Wilhelm Lahann
Geschäftsführer")
