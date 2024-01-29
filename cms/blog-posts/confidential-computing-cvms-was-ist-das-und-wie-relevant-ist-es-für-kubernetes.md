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

Bei der Remote Attestation handelt es sich um eine Weiterentwicklung des CC¹. Mithilfe einer weiteren Maschine in Ihrem System der Sie vertrauen kann bestätigt werden, dass es sich um eine unverändertes Image handelt und die Integrität der neuen Maschine gewährleistet ist. Dies bezieht sich jedoch regelmäßig nur auf das Image das Sie zur Verfügung gestellt haben und nur bedingt auf Inhalte und Programme die nach dem Boot hinzukommen, genauer gesagt extern hinzugefügt werden. Die Technik mit der Remote Attestation arbeitet findet man unter den Namen Measured Boot (Microsoft) oder IMA (Linux).

##### Detail Part

Mit Measured Boot wird eine robuste Vertrauenskette geschaffen. Jeder Schritt des Bootvorgangs zertifiziert den vorherigen, und selbst bei einer Sicherheitslücke bleibt die Kette intakt.

Insgesamt bildet Measured Boot somit das Rückgrat eines vertrauenswürdigen Startvorgangs und gewährleistet, dass unsere digitalen Reisen sicher und unverfälscht verlaufen.

### Integritätsmessungen

Während des Bootvorgangs erstellt Measured Boot kryptografische Hash-Werte oder "Messungen" von entscheidenden Komponenten wie dem Bootloader, dem Betriebssystem-Kernel sowie wichtigen Treibern. Diese Messungen dienen als digitale Fingerabdrücke, die die Unversehrtheit jeder Komponente dokumentieren.

### Platform Configuration Register (PCR)

Die gesammelten Messungen werden in sogenannten Platform Configuration Registern (PCR) abgelegt, die im Trusted Platform Module (TPM) verankert sind. Die PCR-Werte sind vergleichbar mit einem Reisepass für den Startvorgang und dokumentieren jede Etappe der Reise.

### Kontinuierliche Integritätsüberwachung

Was Measured Boot besonders macht, ist seine Fähigkeit zur kontinuierlichen Überwachung. Während des Betriebs überprüft es fortlaufend, ob die aktuellen Messungen mit den ursprünglichen übereinstimmen. Wenn es Hinweise auf Unregelmäßigkeiten gibt, werden die Alarmglocken geläutet.

### Die Sache mit dem Userspace...

Während über Linux IMA theoretisch auch Applikationen aus dem Userspace² attestiert und enforced werden können, ist dies derzeit nicht deterministisch über PCRs möglich. Auch wenn es hier Fortschritt gibt (https://lwn.net/Articles/938914/). Hier wird dann für gewöhnlich direkt auf IMA auf Policen zurückgegriffen. Mit dem Thema IMA beschäftigen wir uns demnächst in einem eigenen Beitrag.

# Die Sache mit SGX...

Nun gibt es da noch SGX. SGX erlaubt es auch einzelne Programme zu kapseln. Der Elefant im Raum, warum dann nicht SGX und lieber TEEs wie AMD SEV-SNP? Einige Gründe:

* SGX benötigt explizite Anpassung der Applikationen, die gekapselt werden sollen, TEEs nicht
* SGX ist bis zu 22x langsamer als TEEs, eine mini VM mit nur einer einzigen Applikation, wie CoCO³, ist also die sinnvollere Alterantive

¹ Confidential Computing\
² Applikationen, die sich nicht im Kernel (Hauptbetriebssystemkomponente) befinden, sondern im Bereich des Benutzers\
³ Confidential Containers