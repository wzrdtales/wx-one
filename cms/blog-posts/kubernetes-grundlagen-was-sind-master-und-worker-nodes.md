---
created-on: 2023-08-01T13:09:54.108Z
f_image:
  url: /assets/images/62c1c3afd210ea09132f-designohnetitel.png
  alt: null
f_author: by Tobias Gurtzick
layout: "[blog-posts].html"
slug: a-helpful-guide-for-overcoming-design-frustration
title: Kubernetes Grundlagen - Was sind Master und Worker Nodes?
updated-on: 2023-08-01T13:09:54.138Z
published-on: 2023-08-01T13:09:54.153Z
f_prev-text: "Die sogenannten #Worker-Nodes und den #Master-Node (control plan/ kurz cp)..."
tags: blog-posts
date: 2023-08-01T13:09:54.170Z
seo:
  title: Kubernetes Grundlagen - Was sind Master und Worker Nodes? - WX-ONE
  og:title: Kubernetes Grundlagen - Was sind Master und Worker Nodes? - WX-ONE
  description: "Die sogenannten #Worker-Nodes und den #Master-Node (control plan/
    kurz cp)..."
  og:image: /assets/images/62c1c3afd210ea09132f-designohnetitel.png
  twitter:title: Kubernetes Grundlagen - Was sind Master und Worker Nodes? - WX-ONE
  additional_tags: >-
    <meta property="og:image:height" content="500">

    <meta property="og:image:width" content="500">

    <meta property="og:site_name" content="WX-ONE">

    <meta property="og:url" content="https://wx1.de/blog-posts/kubernetes-grundlagen-was-sind-master-und-worker-nodes/">

    <meta name="keywords" content="wx1, cloud, wx-one, wxone, wizardtales, iaas, saas, paas, kubernetes, infrastructure, datacenter, csp">
  noindex: false
---
![](/assets/images/62c1c3afd210ea09132f-designohnetitel.png)



\#Kubernetes (k8s) besitzt zwei Hauptkomponenten: Die sogenannten #Worker-Nodes und den #Master-Node (control plan/ kurz cp). Die Worker-Nodes sind die Computer, auf denen deine Programme ausgeführt werden, während der Master-Node der Manager ist, der die Kontrolle über diese Worker-Nodes hat.

Stell dir vor, du bist Leiter einer großen Fabrik, in der verschiedene Aufgaben erledigt werden müssen. Um diese Aufgaben möglichst effizient zu erledigen, solltest du zwei Arten von Mitarbeitern einstellen: Manager und Arbeiter.

Der Master-Node ist vergleichbar mit dem Manager in der Fabrik. Er ist für die Überwachung und Steuerung der Gesamtarbeit verantwortlich. Seine Aufgabe besteht darin, den Überblick über alle Arbeitsprozesse zu behalten und sicherzustellen, dass sie reibungslos ablaufen. Der Master-Node nimmt Anweisungen entgegen und teilt die Arbeit den zuständigen Arbeitern zu.

Die Worker-Nodes sind vergleichbar mit den Arbeitern in der Fabrik. Sie führen die eigentliche Arbeit aus, die ihnen vom Master-Node zugewiesen wurde. Jeder Worker-Node verfügt über Ressourcen wie Rechenleistung (CPU), Speicher und Netzwerkfähigkeiten. Diese Ressourcen werden genutzt, um die jeweiligen Programme und Aufgaben auszuführen, die der Master-Node verteilt hat.

Der Master-Node kommuniziert also mit den Worker-Nodes, weist ihnen Aufgaben zu, überwacht ihre Arbeit und stellt sicher, dass alles reibungslos abläuft. Dieses Zusammenspiel zwischen Master-Node und Worker-Nodes ermöglicht es, komplexe Aufgaben effizient und skalierbar zu erledigen.

Um #Kubernetes zu nutzen, informierst du deinen Manager (Master-Node), welche Programme er wie zu verwalten hat. Du erstellst eine Art Konzept, das als "Kubernetes-Manifest" bezeichnet wird. In diesem Konzept gibst du an, wie viele Kopien eines Programms ausgeführt werden sollen, wie viel Speicher hierfür benötigt wird und andere Richtlinien.

Sobald du deinen Plan erstellt hast, übergibst du das Zepter praktisch an den Master-Node. Dieser übernimmt von nun an die Kontrolle und ist dafür zuständig, dass die Programme dementsprechend ausgeführt werden. Er erstellt automatisch die erforderlichen Kopien der Programme und verteilt sie auf die verfügbaren Worker-Nodes. Wenn einer der Worker-Nodes ausfällt oder nicht mehr richtig funktioniert, kümmert sich der Master-Node darum und sorgt dafür, dass das betroffene Programm auf einem anderen Worker-Node neu gestartet wird.

Hattest du schon Berührungspunkt mit Kubernetes? Schreibs gerne mal in die Kommentare!