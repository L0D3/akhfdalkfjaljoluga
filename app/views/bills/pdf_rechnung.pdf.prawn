render :partial=>'letter/rechnungsrahmen.pdf.prawn',:locals=>{:ppdf=>pdf}
brief_schriftgröße(pdf)

betreff2 (pdf,"<u>"+@rechnungsnummer+"</u>
Rechnung "+@patent.jahresgebühr+". Jahresgebühr für Ihre Patentanmeldung "+@patent.amtlaktenzeichen+" vom "+@patent.anmeldedatum.strftime("%d.%m.%Y")+"
Anmelder: "+@patent.submitter_names+'
"'+@patent.titel+'"')



rechnung (pdf,"
mit Schreiben vom "+@datum.strftime("%d.%m.%Y")+" haben Sie uns beauftragt, für Ihre obige Patentanmeldung die "+@patent.jahresgebühr+". Jahresgebühr in Höhe von "+@patent.preis+",00 €  beim zuständigen Patentamt einzuzahlen.

Wir werden die Einzahlung fristgemäß vornehmen.


Zur Erstattung unserer Auslagen bitten wir um Überweisung von "+@patent.preis+",00 € unter Angabe unseres Zeichens und der Rechnungsnummer "+@rechnungsnummer+" auf unser untenstehendes Konto.


Einzuzahlen innerhalb von 30 Tagen ohne Abzug.



Für Rückfragen stehen wir gerne zur Ihrer Verfügung


Mit freundlichen Grüßen.



Wilhelm Lahann
Geschäftsführer")
