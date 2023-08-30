---
created-on: 2023-08-30T20:07:01.914Z
f_image:
  url: /assets/images/62c1c3afd210ea09132f-designohnetitel.png
  alt: null
f_author: by Tobias Gurtzick
layout: "[blog-posts].html"
slug: a-helpful-guide-for-overcoming-design-frustration
title: Kubernetes auf Deutsch - Was genau ist eigentlich Kubernetes?
updated-on: 2023-08-30T20:07:02.590Z
published-on: 2023-08-30T20:07:03.160Z
f_prev-text: "Die sogenannten #Worker-Nodes und den #Master-Node (control plan/ kurz cp)..."
tags: blog-posts
date: 2023-08-30T20:06:57.259Z
seo:
  title: Kubernetes auf Deutsch - Was genau ist eigentlich Kubernetes? - WX-ONE
  og:title: Kubernetes auf Deutsch - Was genau ist eigentlich Kubernetes? - WX-ONE
  description: Was genau ist eigentlich Kubernetes, wir erklären euch es einmal
    einfach und für jeden Verständlich.
  og:image: /assets/images/62c1c3afd210ea09132f-designohnetitel.png
  twitter:title: Kubernetes auf Deutsch - Was genau ist eigentlich Kubernetes? - WX-ONE
  additional_tags: >-
    <meta property="og:image:height" content="500">

    <meta property="og:image:width" content="500">

    <meta property="og:site_name" content="WX-ONE">

    <meta property="og:url" content="https://wx1.de">

    <meta name="keywords" content="wx1, cloud, wx-one, wxone, wizardtales, iaas, saas, paas, kubernetes, infrastructure, datacenter, csp">
---
Das 2014 von Google entwickelte Kubernetes ist ein #OpenSource System, welches die Verwaltung von Anwendungen in sogenannten Containern erleichtert. Was bedeutet das?

Stell dir vor, du hast eine Anwendung, zum Beispiel eine Website bzw. eine #Software. Normalerweise läuft diese Anwendung auf einem einzigen Server. Das kann gut funktionieren, solange die Anwendung nicht zu komplex oder zu groß wird. Aber wenn die Anwendung wächst & mehr Nutzer hat, kann es schwierig werden, sie auf nur einem Server am Laufen zu halten.

Bsp.: Im “Feinkostladen Kulinski” in Altona ist lediglich eine Kasse geöffnet. Es entstehen lange Warteschlangen, die Leute werden ungeduldig. Sie werden teilweise so erbost, dass sie ihren Einkauf abbrechen. Der Kassierer kommt ins Schwitzen, steht enorm unter Druck & ist sichtlich überfordert mit der Situation. Am nächsten Tag fällt er aus, weil ihm die Last auf seinen Schultern zu groß ist. Langfristig leidet der Umsatz des Standortes stark durch die Abhängigkeit eines Mitarbeiters.

Beim direkten Konkurrent “Feinkost Kulinski” in Eimsbüttel sind zeitgleich 7 Kassen geöffnet. So können bis zu 7 Kunden parallel bedient werden. Die Kunden verteilen sich gleichmäßig auf die jeweiligen Kassen und sind so in wenigen Sekunden bedient, auch wenn der Einkaufswagen mal etwas voller ausfällt. Die Einführung 5 neuer Selbstbedienungskassen sorgt für ein enormes zusätzliches Umsatzwachstum.

Aber wieso ist die Filiale in Eimsbüttel in der Lage, ihre Kunden so zügig zu bedienen?

Möglicherweise nutzen sie #Kubernetes: Es hilft dabei, die Anwendung auf viele verschiedene Server zu verteilen & zu verwalten, die als "Cluster" bezeichnet werden. Die Last wird also auf mehrere Schultern verteilt & gut koordiniert abgearbeitet.

Ein Kubernetes-Cluster besteht aus einem Hauptserver, der als "Master" bezeichnet wird. Dieser Master-Server übernimmt die Kontrolle über die Verteilung & Verwaltung der Anwendung auf den anderen Computern im Cluster, die als "Worker" bezeichnet werden. Die Anwendung wird in speziellen Paketen, den Containern, verpackt, um sicherzustellen, dass sie überall simultan arbeitet.

Der Master-Server von Kubernetes überwacht ständig den Zustand der Anwendung & der Worker-Server. Sollte zum Beispiel ein Worker-Server ausfallen oder überlastet sein, kann Kubernetes automatisch die Anwendung auf einen anderen verfügbaren Server verschieben, um sicherzustellen, dass die Anwendung immer verfügbar ist. Kubernetes setzt Ressourcen effizient ein, indem es die jeweilige Anwendung bei Bedarf auf mehr oder weniger Servern ausführt, je nachdem wie die Auslastung bzw. der Andrang gerade ist. So wird eine Skalierung vollkommen automatisiert.

Insgesamt ermöglicht Kubernetes also eine effiziente Verwaltung von Anwendungen in einer verteilten Umgebung. Es erleichtert die Skalierung, das Überwachen & die Verwaltung von Anwendungen & sorgt dafür, dass sie reibungslos & zuverlässig laufen, unabhängig davon, wie groß oder komplex sie sind.🚀