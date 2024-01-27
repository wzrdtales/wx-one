---
title: Confidential Computing - CVMs - Was ist das und wie relevant ist es für
  Kubernetes?
created-on: 2023-10-16T16:05:32.613Z
updated-on: 2023-10-16T16:05:32.647Z
published-on: 2023-10-16T16:05:32.673Z
f_author: by Tobias Gurtzick
f_prev-text: Confidential Computing kurz CVMs, nur ein Hype, oder ein muss? Wir
  erklären dir sowohl in der Tiefe als auch leicht verständlich zu allem, was du
  wissen musst.
tags: blog-posts
layout: "[blog-posts].html"
date: 2023-10-16T16:05:32.687Z
seo:
  noindex: false
  twitter:title: summary
  twitter:card: summary
---
WX-ONE bietet nun im Beta Programm auch Confidential VMs (CVMs) an, wir starten diesen Launch in dem wir damit erst einmal aufräumen: Confidential Computing, der neue Hype? Wir klären auf: Wer braucht es wirklich, was leistet es tatsächlich und decken falsche Versprechungen auf.

## Vorwort

Wie immer werden wir versuchen, es gerecht für jeden Interessierten zu gestalten und trotzdem in gewohnter fachlicher Tiefe zu erklären. Da es sich in diesem Fall um ein komplexes Thema handelt, teilen wir jeden einzelnen Block in einen Detail Part und einen generalisierten auf. Wenn Sie sich nicht für die tiefen Details interessieren, überspringen Sie einfach jeweils das entsprechende Segment.

# Wie vertrauenswürdig sind CVMs?

Klären wir zuallererst den Elefanten im Raum. Schützt mich eine CVM vor dem Cloud Provider?

Die Antwort ist ein ganz klares nein, wer sich erhofft CVMs könnten einen Schutz etwa vor US-Geheimdiensten darstellen, der irrt sich leider. Sie machen es ganz klar schwieriger, jedoch verschieben CVMs das Problem lediglich vom Cloud-Provider zum Hersteller den CPUs. Alle relevanten CPU Hersteller sind jedoch US-Konzerne und damit kann die Frage relativ einfach beantwortet werden:

\- Keiner kann garantieren, dass CPU Hersteller nicht die Zertifikate herausrücken, die auf die CPUs geschrieben werden.

\- Keiner kann garantieren, dass Cloud Provider XYZ keinen geheimen Deal mit CPU Hersteller XYZ hat und seine eigenen Zertifikate auf die CPUs schreiben lässt.

Wovor eine CVM und Confidential Computing generell allerdings schützt:

\- Vor Mitarbeiter XYZ von Public Cloud Provider XYZ

\- Vor Hackern, die es schaffen, ins Datenzentrum zu spazieren, oder sonstiger weise Zugriff auf den Hypervisor bekommen, auf denen Ihre VMs liegen.

CVMs sind also trotzdem eine interessante Technologie, diese kommt so wie das immer ist, jedoch mit einem Preis, auf den wir später eingehen.



# Was genau ist confidential computing und was sind CVMs?

Confidential computing  ist eine CPU Technologie, welche Entwickelt wurde, um die Sicherheit in geteilten Umgebungen zu verbessern und arbeitet eng mit dem sogenannten TPM Modul zusammen. Allen voran, damit die Cloud. CVMs, confidential VMs, sind dementsprechend also VMs, die diese Technologie nutzen. Es handelt sich kurz gesagt um eine Verschlüsselung des RAM Speichers, jedoch individuell je VM und nicht für das gesamte System. Dies hat den Vorteil, dass zwei VMs selbst bei einer Sicherheitslücke, dieser nicht einfach ausgelesen werden kann. Das Konzept in freier Wildbahn hat zuallererst Intel an den Markt gebracht. Intel ist hier sogar noch einen Schritt weiter gegangen und mit Ihrer SGX Technologie, das mit sogenannten Enklaven arbeitet, dieses Konzept statt auf die Maschine, auf einzelne Programme erweitert.

Kurz gesagt, der Zugriff auf den Speicher wird durch kundenindividuelle Verschlüsselung erschwert. 

Ein weiteres Konzept, welches sich hieraus etablierte, ist die sogenannte Remote attestation, auf die wir im nächsten Abschnitt eingehen.



##### Detail Part



# Was ist die Remote Attestation?

Bei der Remote Attestation handelt es sich um eine Weiterentwicklung des CC¹ mithilfe der einer weiteren Maschine in Ihrem System der Sie vertrauen bestätigt werden kann, das 







¹ Confidential Computing