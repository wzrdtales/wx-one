---
title: Confidential Computing - CVMs - Was ist das und wie relevant ist es für
  Kubernetes?
created-on: 2024-01-30T17:44:24.166Z
updated-on: 2024-01-30T17:44:25.098Z
published-on: 2024-01-30T17:44:25.641Z
f_image:
  url: /assets/images/cchype.jpeg
f_author: by Tobias Gurtzick
f_prev-text: Confidential Computing kurz CVMs, nur ein Hype, oder ein muss? Wir
  erklären dir sowohl in der Tiefe als auch leicht verständlich zu allem, was du
  wissen musst.
tags: blog-posts
layout: "[blog-posts].html"
date: 2024-01-30T17:44:30.805Z
seo:
  noindex: false
  twitter:title: WX-ONE - Confidential Computing - CVMs - Was ist das und wie
    relevant ist es für Kubernetes?
  twitter:card: Confidential Computing kurz CVMs, nur ein Hype, oder ein muss? Wir
    erklären dir sowohl in der Tiefe als auch leicht verständlich zu allem, was
    du wissen musst.
  title: WX-ONE - Confidential Computing - CVMs - Was ist das und wie relevant ist
    es für Kubernetes?
  og:title: WX-ONE - Confidential Computing - CVMs - Was ist das und wie relevant
    ist es für Kubernetes?
  additional_tags: >-
    <meta property="og:image:height" content="500">

    <meta property="og:image:width" content="500">

    <meta property="og:site_name" content="WX-ONE">

    <meta property="og:url" content="https://wx1.de/blog-posts/confidential-computing-cvms-was-ist-das-und-wie-relevant-ist-es-f%C3%BCr-kubernetes/">

    <meta name="keywords" content="wx1, cloud, wx-one, wxone, wizardtales, iaas, saas, paas, kubernetes, infrastructure, datacenter, csp, digitalisierung,sicherheit,cloudsicherheit, cloud-sicherheit, budget, cloudsecurity, cloud-security, cloudcomputing, cloud-computing, appliancebasiertesicherheit, appliance basierte sicherheit, appliance-basierte-sicherheit, opensource, open source, neuvector, open-source">
  description: Confidential Computing kurz CVMs, nur ein Hype, oder ein muss? Wir
    erklären dir sowohl in der Tiefe als auch leicht verständlich zu allem, was
    du wissen musst.
  og:image: /assets/images/cchype.jpeg
---
![](/assets/images/cchype.jpeg)

WX-ONE bietet nun im Beta Programm auch Confidential VMs (CVMs) an, wir starten diesen Launch, in dem wir damit erst einmal aufräumen: Confidential Computing, der neue Hype? Wir klären auf: Wer braucht es wirklich, was leistet es tatsächlich und decken falsche Versprechungen auf.

# Vorwort

Wie immer werden wir versuchen, es gerecht für jeden Interessierten zu gestalten und trotzdem in gewohnter fachlicher Tiefe zu erklären. Da es sich in diesem Fall um ein komplexes Thema handelt, teilen wir jeden einzelnen Block in einen Detail Part und einen generalisierten auf. Wenn Sie sich nicht für die tiefen Details interessieren, überspringen Sie einfach jeweils das entsprechende Segment.

## Die wichtigsten Fragen zuerst

* Schützt mich eine CVM vor dem Cloud-Provider? - **Nein**
* Schützt mich eine CVM vor individuellen Attacken durch Mitarbeiter des Cloud-Providers? - **Ja**
* Schützt mich eine CVM vor einem Hack des Hypervisor meiner VM? - **Ja, außer bei Hardware Bugs**
* Ist es unmöglich, an den Speicher meiner CVM zu gelangen? - **Nein, aber schwierig**
* Muss ich durch den Einsatz von CVMs mehr Geld in die Hand nehmen? - **Ja**
* Wie viel? - **Technologie abhängig, wir betrachten gerade nur die performancebedingten Kosten**

  * TEEs (i.e. AMD-SEV) 5-30% Mehrkosten nur durch Performanceverlust
  * SGX extreme (bis zu 2200% im Vergleich zu TEEs) Mehrkosten nur durch den Performanceverlust
* Garantiert mir die Remote Attestation einen hundertprozentig unkompromittierten Workload? - **Nein**
* Können CVMs über provisioniert werden? - **Im Falle des RAMs, mit den aktuellen CPUs (2024) nein, CPU ja**

## Wie vertrauenswürdig sind CVMs?

Klären wir zuallererst den Elefanten im Raum. Schützt mich eine CVM vor dem Cloud-Provider?

Die Antwort ist ein ganz klares nein, wer sich erhofft CVMs könnten einen Schutz etwa vor US-Geheimdiensten darstellen, der irrt sich leider. Sie machen es ganz klar schwieriger, jedoch verschieben CVMs das Problem lediglich vom Cloud-Provider zum Hersteller, den CPUs. Alle relevanten CPU Hersteller sind jedoch US-Konzerne und damit kann die Frage relativ einfach beantwortet werden:

* Keiner kann garantieren, dass CPU Hersteller nicht die Zertifikate herausrücken, die auf die CPUs geschrieben werden.
* Keiner kann garantieren, dass es keine Backdoors im CPU selbst gibt
* Keiner kann garantieren, dass Cloud Provider XYZ keinen geheimen Deal mit CPU Hersteller XYZ hat und seine eigenen Zertifikate auf die CPUs schreiben lässt.
* Sofern die Firmware für den vTPM nicht open source ist, kann auch durch den TPM manipuliert und der Stack angegriffen werden

Wovor eine CVM und Confidential Computing generell allerdings schützt:

* Vor Mitarbeiter XYZ von Public Cloud Provider XYZ
* Vor Hackern, die es schaffen, ins Datenzentrum zu spazieren, oder sonstiger weise Zugriff auf den Hypervisor bekommen, auf denen Ihre VMs liegen.

CVMs sind also trotzdem eine interessante Technologie, diese kommt so wie das immer ist, jedoch mit einem Preis, auf den wir später eingehen.

## Was genau ist confidential computing und was sind CVMs?

Confidential computing  ist eine CPU Technologie, welche Entwickelt wurde, um die Sicherheit in geteilten Umgebungen zu verbessern und arbeitet eng mit dem sogenannten TPM Modul zusammen. Allen voran, damit die Cloud. CVMs, confidential VMs, sind dementsprechend also VMs, die diese Technologie nutzen. Es handelt sich kurz gesagt um eine Verschlüsselung des RAM Speichers, jedoch individuell je VM und nicht für das gesamte System. Dies hat den Vorteil, dass zwei VMs selbst bei einer Sicherheitslücke, dieser nicht einfach ausgelesen werden kann. Das Konzept in freier Wildbahn hat zuallererst Intel an den Markt gebracht. Intel ist hier sogar noch einen Schritt weiter gegangen und mit Ihrer SGX Technologie, das mit sogenannten Enklaven arbeitet, dieses Konzept statt auf die Maschine, auf einzelne Programme erweitert.

Kurz gesagt, der Zugriff auf den Speicher wird durch kundenindividuelle Verschlüsselung erschwert. 

Ein weiteres Konzept, welches sich hieraus etablierte, ist die sogenannte Remote attestation, auf die wir im nächsten Abschnitt eingehen.

#### Detail Part

Bei CVMs im Speziellen handelt es sich entweder um AMD SEV, SEV-ES, SEV-SNP, oder Intel TDX. Auch Intel SGX mit Ihren Enklaven gibt es noch, hier werden keine ganzen VMs, sondern einzelne Programme in eine Enklave verpackt. 

Die Industrie wendet sich immer mehr von SGX ab, dies hat viele Gründe, angefangen bei dem wirklich unglaublich großen Performance Impact, Memory Limitierungen, aber nicht zuletzt der Unsicherheit, was Intel mit der Technologie vorhat. Denn Intel hat SGX offiziell für consumer CPUs eingestellt, für Intel XEON Prozessoren existiert SGX derweil aktuell noch, die Zukunft ist allerdings mindestens ungewiss.

Während sich AMD SEV und seine Weiterentwicklung SEV-ES hauptsächlich mit der Verschlüsselung (und zusammen mit einem vTPM auch um die Remote Attestation) beschäftigen, führt AMD SEV-SNP auch noch das Konzept der SVSM⁴ ein.

SVSMs sind Applikationen, die im selben Kontext wie die VM gestartet werden. Der Clou, weder die VM noch der Hypervisor können auf die SVSM direkt zugreifen. Ein Beispiel eines Services, der als SVSM ausgeliefert wird, ist ein vTPM als SVSM. Dabei kommuniziert die VM über ein spezielles Kernel Protokoll mit dem jeweiligen SVSM, in diesem Fall unserem TPM. Der Vorteil, das TPM ist vor Manipulationen geschützt. Ist das TPM ephemeral kann sogar der Cloud Provider keine Daten mehr einschleusen. 

## Was kostet mich das Ganze?

Um eine CVM zu starten, können Sie das in aller Regel einfach über den Provider Ihrer Wahl. Mehrkosten können an mehreren Stellen entstehen. Brauchen Sie etwa noch einen Key Management Server, etwa für Festplattenverschlüsselungen und andere kryptografische Routinen. Der vTPM kann Kosten erzeugen, sollte er persistenten Speicher besitzen. Dies ist etwa bei Azure der Fall.

Dann kommen noch schwer erfassbare Kosten hinzu. Evtl. benötigte Mitarbeiter oder Technologien zur Unterstützung bei der Validierung der Remote Attestation. Das Ausgleichen des Performance-Defizits von CVMs und nicht zuletzt Anpassungen in Ihrem Stack. Denn benötigen Sie auch ein spezielles Image wie <https://ubuntu.com/blog/introducing-confidential-vms-on-ubuntu-pro-for-azure>

## Eigentlich alles noch gar nicht fertig!

Einen großen Haken gibt es bei dem Thema CVMs und insbesondere die neuesten Iterationen: SEV-SNP mit SVSMs als neuer Komponente. So sind bis heute die notwendigen Änderungen insb. für die Remote Attestation noch gar nicht im Linux Kernel angekommen. Das Gleiche gilt für die SVSMs. Bei den Providern, und damit sprechen wir über alle, egal ob AWS, Azure, oder auch wir, gilt daher:

Die Software hinter der Hardware ist eigentlich noch eine Vorabversion, an der sich noch viel bewegt.

Übrigens sollten Sie bei sich selbst on-premise die neueste Generation einsetzen wollen, benötigen Sie auch für AMD SEV-SNP einen selbst gebauten Kernel aus dem offiziellem AMD Repo <https://github.com/AMDESE/AMDSEV/tree/snp-latest>.

Bei den SVSM geht es sogar einen Schritt weiter, den ersten Wurf lieferte AMD, das originale Projekt ist mittlerweile eingestellt, jetzt entwickelt es allen voran SUSE Linux im neuem Coconut SVSM <https://github.com/coconut-svsm/svsm>

## Was ist die Remote Attestation?

Bei der Remote Attestation handelt es sich um eine Weiterentwicklung des CC¹. Mithilfe einer weiteren Maschine in Ihrem System, der Sie vertrauen kann bestätigt werden, dass es sich um ein unverändertes Image handelt und die Integrität der neuen Maschine gewährleistet ist. Dies bezieht sich jedoch regelmäßig nur auf das Image, das Sie zur Verfügung gestellt haben und nur bedingt auf Inhalte und Programme, die nach dem Boot hinzukommen, genauer gesagt extern hinzugefügt werden. Die Technik, mit der Remote Attestation arbeitet, findet man unter den Namen Measured Boot (Microsoft) oder IMA (Linux).

#### Detail Part

Mit Measured Boot wird eine robuste Vertrauenskette geschaffen. Jeder Schritt des Bootvorgangs zertifiziert den vorherigen, und selbst bei einer Sicherheitslücke bleibt die Kette intakt.

Insgesamt bildet Measured Boot somit das Rückgrat eines vertrauenswürdigen Startvorgangs und gewährleistet, dass unsere digitalen Reisen sicher und unverfälscht verlaufen.

### Integritätsmessungen

Während des Bootvorgangs erstellt Measured Boot kryptografische Hash-Werte oder „Messungen“ von entscheidenden Komponenten wie dem Bootloader, dem Betriebssystem-Kernel sowie wichtigen Treibern. Diese Messungen dienen als digitale Fingerabdrücke, die die Unversehrtheit jeder Komponente dokumentieren.

### Platform Configuration Register (PCR)

Die gesammelten Messungen werden in sogenannten Platform Configuration Registern (PCR) abgelegt, die im Trusted Platform Module (TPM) verankert sind. Die PCR-Werte sind vergleichbar mit einem Reisepass für den Startvorgang und dokumentieren jede Etappe der Reise.

### Kontinuierliche Integritätsüberwachung

Was Measured Boot besonders macht, ist seine Fähigkeit zur kontinuierlichen Überwachung. Während des Betriebs überprüft es fortlaufend, ob die aktuellen Messungen mit den ursprünglichen übereinstimmen. Wenn es Hinweise auf Unregelmäßigkeiten gibt, werden die Alarmglocken geläutet.

### Die Sache mit dem Userspace …

Während über Linux IMA theoretisch auch Applikationen aus dem Userspace² attestiert und enforced werden können, ist dies derzeit nicht immer zuverlässig deterministisch über PCRs möglich. Auch wenn es hier Fortschritt gibt (<https://lwn.net/Articles/938914/>). Hier wird dann für gewöhnlich direkt auf IMA auf Policen zurückgegriffen. Mit dem Thema IMA beschäftigen wir uns demnächst in einem eigenen Beitrag.

## Die Sache mit SGX …

Nun gibt es da noch SGX. SGX erlaubt es auch einzelne Programme zu kapseln. Der Elefant im Raum, warum dann nicht SGX und lieber TEEs wie AMD SEV-SNP? Einige Gründe:

* SGX benötigt explizite Anpassung der Applikationen, die gekapselt werden sollen, TEEs nicht
* SGX ist bis zu 22x langsamer als TEEs, eine Mini VM mit nur einer einzigen Applikation, wie CoCO³, ist also die sinnvollere Alternative
* SGX hat ein capped memory limit (64GB bei SGXv2 64bit)

## Was genau bringt mir eine CVM?

Zu guter Letzt noch einmal zum Positiven. Die CVM sorgt dafür, dass der Workload (verschlüsselter RAM) auf fremden wie eigenen Systemen sicher vor neugierigen Augen ist. Es macht es erheblich schwieriger, Informationen aus der betroffenen CVM zu entwenden. Natürlich geht dies mit einem Performance-Impact ein, es bleibt dabei jedem selbst überlassen, ob es für den jeweiligen Workload tatsächlich sinnvoll ist, das Geld in die Hand zu nehmen. Auch das ist das positive, CVMs, sind eine Option, keine Verpflichtung.

Zusammen mit Remote Attestation, und entweder einer cleveren Nutzung der Linux IMA oder aber Mini VMs, ala CoCO³, lassen sich außerdem sehr interessante Hochsicherheitssysteme aufbauen, die sich vollständig attestieren lassen.

## CVMs und Kubernetes

Zusammen mit Linux IMA und der Remote Attestation lässt sich bereits etwa eine besonders gesicherte Infrastruktur errichten. Etwa kann eingegrenzt werden, mit welchem Tooling Container ausgeführt werden können. Etwa das Erzwingen von notarisierten Container Images, um nur vertraute Workloads auszuführen. Mithilfe von SVSM wird dieser Prozess noch einmal vertrauenswürdiger.

Kubernetes selbst profitiert von CVMs nicht direkt, jedoch können Workloads so sensibel sein, dass auf CVMs zurückgegriffen wird.

¹ Confidential Computing\
² Applikationen, die sich nicht im Kernel (Hauptbetriebssystemkomponente) befinden, sondern im Bereich des Benutzers\
³ Confidential Containers\
⁴ Secure VM Service Module