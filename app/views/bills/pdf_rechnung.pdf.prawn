render :partial=>'letter/rechnungsrahmen.pdf.prawn',:locals=>{:ppdf=>pdf,:rechnungsdatum=>@rechnungsdatum}
brief_schriftgröße(pdf)

betreff2 (pdf,"<u>"+@rechnungsnummer+"</u>
Rechnung "+@patent.jahresgebühr+". Jahresgebühr für Ihre Patentanmeldung "+@patent.amtlaktenzeichen+" vom "+@patent.anmeldedatum.strftime("%d.%m.%Y")+"
Anmelder: "+@user+'
"'+@patent.titel+'"')


rechnung(pdf,
"mit Schreiben vom "+@datum.strftime("%d.%m.%Y")+" haben Sie uns beauftragt, für Ihre obige Patentanmeldung die "+@patent.jahresgebühr+". Jahresgebühr in Höhe von "+@patent.preis(nil)+" €  beim zuständigen Patentamt einzuzahlen.

Wir werden die Einzahlung fristgemäß vornehmen.

",

"An diesem Schutzrecht besteht folgende Anteilssituation, nach der sich auch die Kostentragungspflicht regelt:",
"Zur Erstattung unserer Auslagen bitten wir um Überweisung von "+@anteil+" € unter Angabe unseres Zeichens und der Rechnungsnummer "+@rechnungsnummer+" auf unser untenstehendes Konto.


Zahlbar innerhalb von 30 Tagen ohne Abzug.



Für Rückfragen stehen wir gerne zur Ihrer Verfügung


Mit freundlichen Grüßen.



Wilhelm Lahann
Geschäftsführer")
