# Wireshark

* [TCP Window Size](https://docs.microsoft.com/en-us/troubleshoot/windows-server/networking/description-tcp-features)

## Steganography

steghide - a steganography program that is able to hide data in various kinds of image- and audio-files. The color-  respectivly  sample-frequencies are  not changed  thus  making  the  embedding  resistant against first-order statistical tests. Features include the compression of the embedded data, encryption of the  embed‐ded  data  and automatic integrity checking using a checksum. The JPEG, BMP, WAV

DESCRIPTION
       Steghide  is  a steganography program that is able to hide data in various kinds
       of image- and audio-files. The color-  respectivly  sample-frequencies  are  not

DESCRIPTION
       Steghide  is  a steganography program that is able to hide data in various kinds
       of image- and audio-files. The color-  respectivly  sample-frequencies  are  not
       changed  thus  making  the  embedding  resistant against first-order statistical
       tests.

       Features include the compression of the embedded data, encryption of the  embed‐
       ded  data  and automatic integrity checking using a checksum. The JPEG, BMP, WAV
       and AU file formats are supported for use as cover file. There are  no  restric‐
       tions on the format of the secret data.

       Steghide  uses  a  graph-theoretic approach to steganography. You do not need to
       know anything about graph theory to use steghide and you  can  safely  skip  the
       rest  of  this paragraph if you are not interested in the technical details. The
       embedding algorithm roughly works as follows: At first, the secret data is  com‐
       pressed  and encrypted. Then a sequence of positions of pixels in the cover file
       is created based on  a  pseudo-random  number  generator  initialized  with  the
       passphrase  (the secret data will be embedded in the pixels at these positions).
       Of these positions those that do not need to be changed  (because  they  already
       contain  the  correct  value  by  chance) are sorted out. Then a graph-theoretic
       matching algorithm finds pairs of positions such that  exchanging  their  values
       has  the  effect  of embedding the corresponding part of the secret data. If the
       algorithm cannot find any more such pairs all exchanges are actually  performed.
       The pixels at the remaining positions (the positions that are not part of such a
       pair) are also modified to contain the embedded data (but this is done by  over‐
       writing  them,  not  by exchanging them with other pixels).  The fact that (most
       of) the embedding is done by exchanging pixel values implies that the  first-or‐
       der  statistics  (i.e. the number of times a color occurs in the picture) is not
       changed. For audio files the algorithm is the same, except  that  audio  samples
       are used instead of pixels.

       The  default encryption algorithm is Rijndael with a key size of 128 bits (which
       is AES - the advanced encryption standard) in the cipher block chaining mode. If
       of) the embedding is done by exchanging pixel values implies that the  first-or‐
       der  statistics  (i.e. the number of times a color occurs in the picture) is not
       changed. For audio files the algorithm is the same, except  that  audio  samples
       are used instead of pixels.

       The  default encryption algorithm is Rijndael with a key size of 128 bits (which
       is AES - the advanced encryption standard) in the cipher block chaining mode. If
       you  do  not  trust this combination for whatever reason feel free to choose an‐
       other algorithm/mode combination (information about all possible algorithms  and
       modes  is  displayed  by the encinfo command).  The checksum is calculated using
       the CRC32 algorithm.

COMMANDS
       In this section the commands for steghide are listed. The  first  argument  must
       always  be one of these commands. You can supply additional arguments to the em‐
       bed, extract and info commands. The other commands to not take any arguments.

       embed, --embed
              Embed secret data in a cover file thereby creating a stego file.

       extract, --extract
              Extract secret data from a stego file.

       info, --info
              Display information about a cover or stego file.

       encinfo, --encinfo
              Display a list of encryption algorithms and modes that can  be  used.  No
              arguments required.

       version, --version
              Display short version information. No arguments required.

       license, --license
              Display steghide's license. No arguments required.

       help, --help
              Display a help screen. No arguments required.

## Hashcat

DESCRIPTION
       Hashcat is the world’s fastest CPU-based password recovery tool.

       While  it's  not  as  fast as its GPU counterpart oclHashcat, large lists can be
       easily split in half with a good dictionary and a bit of knowledge of  the  com‐
       mand switches.

       Hashcat is the self-proclaimed world’s fastest CPU-based password recovery tool,
       Examples of hashcat supported hashing algorithms are Microsoft LM  Hashes,  MD4,
       MD5, SHA-family, Unix Crypt formats, MySQL, Cisco PIX.

hashcat -m 0 -a 0 -o solved.txt hash.txt /usr/share/rockyou.txt --force

## GPG

DESCRIPTION
       gpg  is  the OpenPGP part of the GNU Privacy Guard (GnuPG). It is a tool to pro‐
       vide digital encryption and signing services using  the  OpenPGP  standard.  gpg
       features complete key management and all the bells and whistles you would expect
       from a full OpenPGP implementation.

       There are two main versions of GnuPG: GnuPG 1.x and GnuPG 2.x.  GnuPG  2.x  sup‐
       ports  modern encryption algorithms and thus should be preferred over GnuPG 1.x.
       You only need to use GnuPG 1.x if your platform doesn't support  GnuPG  2.x,  or
       you need support for some features that GnuPG 2.x has deprecated, e.g., decrypt‐
       ing data created with PGP-2 keys.

       If you are looking for version 1 of GnuPG, you may find that  version  installed
       under the name gpg1.

gpg --list-keys

gpg --gen-key

gpg --delete-secret-and-public-key

## nmap

Nmap (“Network Mapper”) is an open source tool for network exploration and security auditing.

nmap -sV
nmap -sV -oN zenmapscan.txt --script smb-enum-shares 192.168.0.10`

Use nmap -O -p 1-500 --osscan-guess to perform OS fingerprinting, and scan ports 1 through 500.
Use uname -a to print the OS type and version.
Use nmap -sV to enumerate service type.
Use nmap -A -T4 to perform OS fingerprinting using fast execution.
Use nmap -sO to perform an IP protocol scan.
Use nmap -sU -F to perform device and port enumeration.
Use nmap -sA to enumerate the type of firewall in use.

## searchsploit

search icecast
use 0
set RHOST
search -f *secretfile*.txt

## msfconsole

## Github

* Commands include:
  * git clone
  * git add
  * git commit -m
  * git push

## ufw

* `sudo ufw reset` to reset all UFW rules back to factory defaults.
* `sudo ufw status` to check the current status of the firewall.
* `sudo ufw enable` to start the firewall and update rules.
* `sudo ufw reload` to stop, and restart the UFW firewall.
* `sudo ufw default deny incoming` to block all incoming connections.
* `sudo ufw default allow outgoing` to allow all outgoing connections.
* `sudo ufw allow` to open specific ports.
* `sudo ufw deny` to close specific ports.
* `sudo ufw delete` to delete rules.
* `sudo ufw disable` to shut down the firewall.

## firewalld

* `sudo /etc/init.d/firewalld start` to start firewalld.
* `sudo firewall-cmd --list-all-zones` to list all current zones.
* `sudo firewall-cmd --zone=home --change-interface=eth0` to bind together interfaces.
* `sudo firewall-cmd --get-services` to list currently configured services.
* `sudo firewall-cmd --zone=home --list-all` to list all currently configured services for a specific zone.
* `sudo firewall-cmd --zone=home --add-rich-rule=` to add specific rules to specific zones.
* `--add-icmp-block=echo-reply --add-icmp-block=echo-request` to block pings for specific zones.
