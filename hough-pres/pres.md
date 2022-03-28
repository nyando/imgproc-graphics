# Motivation

- Erkennung von geometrischen Figuren in Bildern.
- Ursprünglich zur Erkennung von Linien entwickelt.
- Anwendbar auf diverse geometrische Figuren, z. B. auch Kreise.
- Bedingt eine Vorverarbeitung mit einem Kantenfilter (_Sobel_, _Canny_, o. Ä.).

# Historisches

- **Peter Hough** - Patentanmeldung des Verfahrens im Jahre 1962.
- Ursprünglich zur maschinellen Analyse von Bildern aus Blasenkammern entwickelt.
- Teilchen in einer Blasenkammer ziehen lineare Spuren hinter sich her.
- Anhand eines Bildes bspw. Eintrittswinkel des Teilchens bestimmen.

# Grundidee

- geometrische Figuren lassen sich durch Parameter beschreiben
  - _Linie_: Punkt und Winkel (2 Parameter)
  - _Kreis_: Mittelpunkt und Radius (3 Parameter)
- Transformation des Bildes in den _Hough-Raum_
  - Raum der Figurenparameter
  - "Votingverfahren" über die wahrscheinlichsten Parameter einer Figur
