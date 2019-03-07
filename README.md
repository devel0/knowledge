# knowledge

references for linux admin and development 

<hr/>

## TOC

- [electronics](#electronics)
- [shell](#shell)
- [development tools](#development-tools)
- [csharp](#csharp)
- [c++](#c)
- [database](#database)
- [webdevel](#webdevel)
- [networking](#networking)
- [linux](#linux)
- [security](#security)
- [mobile native](#mobile-native)
- [tools](#tools)
- [media](#media)

<hr/>

### electronics
- arduino
  - [vscode arduino](doc/vscode-arduino.md)
  - [arduino on atmega8](doc/arduino-on-atmega8.md)
  - [atmega power save](doc/atmega-power-save.md)
  - [arduino examine elf](doc/arduino-examine-elf.md)
  - [esp8266 board plugin](https://github.com/esp8266/Arduino#installing-with-boards-manager) ( use `http://arduino.esp8266.com/staging/package_esp8266com_index.json` for development )
  - [esp8266 twi arduino nano problems](doc/esp8266-twi-arduino-nano.md)  
- [schematics and pcb editor](https://easyeda.com/)
- [qucs circuit simulator](doc/qucs.md)
- [simulator](http://everycircuit.com)
- [pcb etching](doc/pcb-etching.md)
- [npn transistor biasing](_files/npn-transistor-biasing.xlsx)  
- [ethernet cabling T568A](http://pinouts.ru/NetworkCables/ethernet_10_100_1000_pinout.shtml)  

### shell
- [linux scripts](https://github.com/devel0/linux-scripts-utils)
- [trap control+c](doc/trap-ctrlc.md)
- [function arguments expansion](doc/function-args-expansion.md)
- [formatted print](doc/formatted-print.md)
- [find xargs and exec](doc/find-and-exec.md)
- [get file size](doc/get-file-size.md)
- [file age sec](https://github.com/devel0/linux-scripts-utils/blob/master/file-age-sec)
- [elapsed seconds date](doc/elapsed-seconds.md)
- [terminal color](https://misc.flogisoft.com/bash/tip_colors_and_formatting)
- [escape html](doc/escape-html.md)
- [uri encode](doc/uri-encode.md)
- [bash scripting](doc/bash-scripting.md)
- [jq json tool](doc/jq-json-tool.md)

### development tools
- git
  - [change remote](doc/change-remote.md)
  - [clone tag](doc/clone-tag.md)
  - [commit to new branch](doc/commit-to-new-branch.md)
  - [work with commits](doc/change-commit.md)
- vscode
  - [tips](doc/vscode-tips.md)
  - [settings](doc/vscode-settings.md)
  - [useful extensions](doc/vscode-useful-extensions.md)
  - [troubleshoot](doc/vscode-troubleshoot.md)
  - [debug firefox](doc/vscode-debug-firefox.md)  
- [gnuplot](doc/gnuplot.md)
- nuget
  - [linux-install](doc/nuget-linux-install.md)
  - [local packages](doc/nuget-config-local-packages.md)
  - [troubleshoot](doc/troubleshoot.md)

### csharp
- [send email 465](doc/send-email-465.md)
- [psql ef codefirst](doc/psql-ef-codefirst.md)
- [asp net core](doc/asp-net-core.md)
- [dotnet core unix interop](doc/dotnet-core-unix-interop.md)
- [dotnet gui](doc/dotnet-avalonia.md)
- [dotnet netcorestandard testunit](https://github.com/devel0/netcore-util/tree/6267b9e954692ecc7513ccb9616d590128294598#how-this-project-was-built)
- [regex](doc/regex.md)

### c++
- [linux vscode debug](https://github.com/devel0/example-vscode-linux-cpp-debug)
- [dump-file-to-c](doc/dump-file-to-c.md)  

### database
- [psql password in file](doc/psql-password-in-file.md)
- [psql select datetime timezone](doc/select-datetime-timezone.md)
- [pgadmin](doc/pgadmin.md)
- entity framework
  - [load related entities](https://docs.microsoft.com/en-us/ef/core/querying/related-data)

### webdevel
- [javascript/jquery](doc/javascript-jquery.md)
  - [momentjs date](doc/momentjs-date.md)
- [bootstrap css](doc/bootstrap-css.md)
- [chrome](doc/chrome.md)
- imagemap ( just use gimp Filters/Web/Imagemap )
- [grunt troubleshoot](doc/grunt-troubleshoot.md)

### networking
- send a tcp packet `echo sample | nc 10.10.2.10 1000`
- [test webapi](doc/test-webapi.md)
- [send simple message over udp](doc/send-simple-message-over-udp.md)
- [send email](doc/send-email-wrapper.md)
- [tune nginx for webapi](doc/nginx-webapi-conf.md)  
- [run wireshark as nonroot](doc/run-wireshark-as-nonroot.md)      
- [xrdp remmina](doc/xrdp-remmina.md)  
- [force zimbra smtp auth](doc/zimbra-force-smtp-auth.md)
- [mobile server](doc/mobile-server.md)
- monitor interfaces bandwidth `bmon -p eth0,eth1`

### linux
- [quick and dirty os install notes](doc/quick-and-dirty-server-install-notes.md)
- [tune inotify](doc/tune-inotify.md)    
- [tail grep continous](doc/tail-grep-continuous.md)
- [force log rotate](doc/force-log-rotate.md)  
- [su with sudo colorful prompt](doc/su-with-sudo-prompt.md)  
- [i18n decimal separator dot](doc/decimal-separator-dot.md)  
- [draftsight open dxf](doc/draftsight-open-with-dxf.md)
- packages
  - [packages build dep](doc/build-dep.md)  
  - [retrieve package source](doc/retrieve-package-source.md)    
  - upgrade single package `apt-get install --only-upgrade package`  
- processes  
  - [process management](doc/process-management.md) 
  - [autorespawn process using supervisor](https://github.com/devel0/dynamic-firewall/tree/e15ce9d0e152dee37a6a5dfff9a5f543914d5c6f#config-supervisor)
  - show memoy usage `smem --pie name -s rss`
- [ubuntu 18.04 tune](doc/ubuntu-18.04-tune.md)
  - touchpad right click not work
  - monitor sysload util
  - shutter edit
  - modal window detach
  - flatpak software manager
  - wifi auth error if lid closed
  - customize menu
  - thunderbird huge font fix
  - useful aliases
  - add templates to nautilus (right click)
  - install nextcloud, kdeconnect, freecad
  - gstreamer plugins
  - change default app  
  - [force monitor mode](http://ubuntuhandbook.org/index.php/2017/04/custom-screen-resolution-ubuntu-desktop/)
- virtualization
  - [convert qcow2 to vdi](doc/convert-qcow2-to-vdi.md)
  - [virtualbox](doc/virtualbox.md)
- [rsyslog strip](doc/rsyslog-strip.md)
- driver
  - [card reader](doc/card-reader.md)
  - [bit4id minilector evo driver 64bit](doc/bit4id-minilector-evo.md)
  - [wacom inkscape pressure](doc/wacom-inkscape-pressure.md)
  - [epson scanner gt-s50](doc/driver-epson-gt-s50.md)
- disks
  - [create bootable iso](https://raw.githubusercontent.com/jsamr/bootiso/master/bootiso)
  - [replace raid md damaged disk](doc/replace-raid-md-damaged-disk.md)    
  - force reread partition : `partprobe <device>`
  - [create uefi usb from iso](doc/create-uefi-usb-from-iso.md)
- docker containers
  - [docker backup](doc/docker-backup.md)
  - [show layer commands](doc/show-layer-commands.md)  
  - doc not included ( see `/etc/dpkg/dpkg.cfg.d/excludes` )
  - [test swap memory](doc/test-swap-memory.md)
  - scripts
    - [dk-id](https://github.com/devel0/linux-scripts-utils/blob/master/dk-id)
    - [dk-purge-log](https://github.com/devel0/linux-scripts-utils/blob/master/dk-purge-log)
    - [dk-net](https://github.com/devel0/linux-scripts-utils/blob/master/dk-net)

### security
- [iptables firewall](https://github.com/devel0/linux-scripts-utils/blob/master/fw.sh)
- [generate htpasswd](doc/generate-htpasswd.md)
- [show cert info](https://github.com/devel0/linux-scripts-utils/blob/master/show-cert-info)
- [id_rsa](doc/id_rsa.md)  
- [ssh client alive](doc/ssh-keep-alive.md)

### mobile native
- [intellij android studio](doc/intellij-android-studio.md)
- [android push notify](doc/android-push-notify.md)

### tools
- [cygwin install](doc/cygwin-install.md)    
- [win10 quick assist](doc/win10-quick-assist.md)
- document
  - [nano editor](doc/nano-editor.md)
  - [hex editor : bless](https://github.com/bwrsandman/Bless)
  - [markdown toc](doc/markdown-toc.md)
  - [markdown to pdf](doc/markdown-to-pdf.md)
  
### media
- sound
  - console player `apt install mocp`
- graphics
  - [qrcode](doc/qrcode.md)  
  - [record animated gif](doc/record-animated-gif.md)
  - [freecad troubleshoot svg import](doc/freecad-import-svg-segmentation-fault.md)
  - [resize image](doc/resize-image.md)
  - [m2t to mpg seekable](doc/m2t-to-mpg-seekable.md)
  - [video transcoding](doc/video-transcoding.md)
  - [remove image exif](doc/remove-image-exif.md)
