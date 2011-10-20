render :partial=>'letter/briefrahmen.pdf.prawn',:locals=>{:ppdf=>pdf}
brief_schriftgröße(pdf)

warning_box2(pdf,
"Letzte Erinnerung:",
"FRISTSACHE! Rechtsverfall droht!",
"Zurück per Fax an 06881 962256"
)
betreff_patentanfrage pdf

anschreiben(pdf,
"zur Aufrechterhaltung Ihres obigen Schutzrechtes wird am "+@patent.gebührenfälligkeit.strftime("%d.%m.%Y")+" die "+@patent.jahresgebühr+". Jahresgebühr in Höhe von "+@patent.preis(nil)+",00 € fällig.

Nach Ablauf dieser Frist ist für ein Zeitraum von sechs Monaten eine Nachzahlung der Gebühr zzgl. eines Verspätungszuschlages in Höhe von 50% der jeweils fälligen Jahresgebühr noch möglich, ohne einen Rechtsverlust zu erleiden. Nach Ablauf dieser Frist verfällt Ihr Schutzrecht.

Sollten Sie die Anmeldung aufgeben wollen, ist diese, soweit das Schutzrecht auf eine unbeschränkt in Anspruch genommene Diensterfindung zurückgeht und die Vergütungsansprüche der Erfinder gemäß Arbeitnehmererfindergesetz nicht abgegolten sind, den Erfindern spätestens zwei Monate vor dem drohenden Rechtsverlust anzubieten.

Bitte teilen Sie uns bis zum <u>"+@patent.ersteerinnerung.strftime("%d.%m.%Y")+"</u> durch Ankreuzen Ihrer Aufrechterhaltungsentscheidung, Unterschrift und Rückübersendung dieses Schreibens an angegebene Faxnummer verbindlich mit, ob Sie obiges Schutzrecht aufrecht erhalten wollen und ob wir die Einzahlung der nächsten Gebühr für Sie veranlassen sollen.")
checkbox_1 pdf
checkbox_2 pdf

