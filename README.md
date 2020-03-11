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
- [measure usb cable resistance](doc/measure-usb-cable-resistance.md)
- [UM34C linux log](doc/UM34C-linux-log.md)

### shell
- [ttyrec ttygif](doc/ttyrec-ttygif.md)
- [linux scripts](https://github.com/devel0/linux-scripts-utils)
- [trap control+c](doc/trap-ctrlc.md)
- [function arguments expansion](doc/function-args-expansion.md)
- [formatted print](doc/formatted-print.md)
- [diff huge files](doc/diff-huge-files.md)
- [find xargs and exec](doc/find-and-exec.md)
- [get file size](doc/get-file-size.md)
- [file age sec](https://github.com/devel0/linux-scripts-utils/blob/master/file-age-sec)
- [elapsed seconds date](doc/elapsed-seconds.md)
- [terminal color](https://misc.flogisoft.com/bash/tip_colors_and_formatting)
- [escape html](doc/escape-html.md)
- [uri encode](doc/uri-encode.md)
- [bash scripting](doc/bash-scripting.md)
- [jq json tool](doc/jq-json-tool.md)
- [ensure kill process](doc/ensure-kill-process.md)
- sed
  - [replace newline](http://www.benjiegillam.com/2011/09/using-sed-to-replace-newlines/)
- time GMT `TZ=GMT date +@GMT-%Y.%m.%d-%H.%M.%S`

### development tools
- [git](doc/git-usage.md)  
- vscode
  - [tips](doc/vscode-tips.md)
  - [keybinding](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf)
  - [settings](doc/vscode-settings.md)
  - [useful extensions](doc/vscode-useful-extensions.md)
  - [troubleshoot](doc/vscode-troubleshoot.md)
  - [debug firefox](doc/vscode-debug-firefox.md)  
  - [show external code](doc/vscode-show-external-code.md)
- [gnome development](doc/gnome-development.md)
- [gnuplot](doc/gnuplot.md)
- nuget
  - [linux-install](doc/nuget-linux-install.md)
  - [local packages](doc/nuget-config-local-packages.md)
  - [troubleshoot](doc/troubleshoot.md)

### csharp
- [send email 465](doc/send-email-465.md)
- [psql ef codefirst](doc/psql-ef-codefirst.md)
- dotnet core
  - [netcore csproj](doc/netcore-csproj.md) ( generate doc, copy to output, define macro, exclude files from compile, disable warnings )
  - [netcore platform environment](doc/netcore-platform-environment.md) ( os type, debug macro )
  - [asp net core](doc/asp-net-core.md)
  - [dotnet sdks](https://github.com/dotnet/core-sdk) - [installers](https://dotnet.microsoft.com/download/dotnet-core)
  - [dotnet cmdline](doc/dotnet-cmdline.md)
  - [dotnet core unix interop](doc/dotnet-core-unix-interop.md)
  - [dotnet gui](doc/dotnet-avalonia.md)
  - [dotnet netcorestandard testunit](https://github.com/devel0/netcore-util/tree/6267b9e954692ecc7513ccb9616d590128294598#how-this-project-was-built)
- [regex](doc/regex.md)
- [csharp to typescript](doc/csharp-to-typescript.md)
- [xlsx finalize worksheet freeze columns](https://github.com/devel0/worked-hours-tracker/blob/e947095bba1c52010651e79fbf2f44d82f600adc/WorkedHoursTrackerWebapi/Controllers/ApiController.cs#L543-L557)
- [wpf](doc/wpf.md)
- [tuple value read write](doc/tuple-value-read-write.md)

### c++
- [linux vscode debug](https://github.com/devel0/example-vscode-linux-cpp-debug)
- [dump-file-to-c](doc/dump-file-to-c.md)  

### database
- [create pgsql container](doc/create-pgsql-container.md)
- [psql backup restore](doc/psql-backup-restore.md)
- [psql password in file](doc/psql-password-in-file.md)
- [psql select datetime timezone](doc/select-datetime-timezone.md)
- diagramming schema
  - [schema crawler](doc/psql-schema-crawler.md)
  - [automatic generate psql db diagram](https://github.com/cbbrowne/autodoc)
- [pgadmin](doc/pgadmin.md)
- entity framework
  - [load related entities](https://docs.microsoft.com/en-us/ef/core/querying/related-data)

### webdevel
- [javascript/jquery](doc/javascript-jquery.md)
  - [momentjs date](doc/momentjs-date.md)
- [bootstrap css](doc/bootstrap-css.md)
- [sandbox repro](doc/sandbox-repro.md)
- [chrome](doc/chrome.md)
- imagemap ( just use gimp Filters/Web/Imagemap )
- [grunt troubleshoot](doc/grunt-troubleshoot.md)
- npm
  - [tips](doc/npm-tips.md)
  - [proxy cache](doc/npm-proxy-cache.md)  
- typescript
  - support for optional chaining conditional `?` operator (upgrade `react-scripts` to `3.3.0`)
- react / material.ui ( typescript )
  - create react typescript `yarn create react-app my-app --template typescript`
  - [app skeleton and global states](https://github.com/devel0/example-react-global-state)
  - [create react library useHook error](https://github.com/transitive-bullshit/create-react-library/issues/99#issuecomment-463177704)
  - [resposive drawer with styles and theme](doc/material-ui-responsive-drawer-styles-theme-typescript.md)
  - [common styles combined](https://github.com/mui-org/material-ui/issues/11517#issuecomment-478337616)

### networking
- send a tcp packet `echo sample | nc 10.10.2.10 1000`
- [test webapi](doc/test-webapi.md)
- [send simple message over udp](doc/send-simple-message-over-udp.md)
- [send email](doc/send-email-wrapper.md)
- [tune nginx for webapi](doc/nginx-webapi-conf.md)  
- wireshark
  - [run wireshark as nonroot](doc/run-wireshark-as-nonroot.md)      
  - [wireshark chrome decrypt ssl](doc/wireshark-chrome-decrypt-ssl.md)
- [https proxy sniffer](doc/https-proxy-sniffer.md)
- [xrdp remmina](doc/xrdp-remmina.md)  
- [force zimbra smtp auth](doc/zimbra-force-smtp-auth.md)
- [mobile server](doc/mobile-server.md)
- monitor interfaces bandwidth `bmon -p eth0,eth1` or `nload -m`
- quick list interface addresses `ip -br a`
- [ethernet cabling T568B](http://www.comnen.com/whats-the-difference-between-t568a-and-t568b/)
- scan hostnames `nmap -sn addr/mask`
- scan bluetooth devices `hcitool scan`

### linux
- server
  - [quick and dirty os install notes](doc/quick-and-dirty-server-install-notes.md)
  - [ubuntu server post install](doc/ubuntu-server-post-install.md)  
- gnome
  - [shell extension with bash](https://github.com/p-e-w/argos)
  - [fix sort icon direction](https://bugs.launchpad.net/ubuntu/+source/gtk+3.0/+bug/1840516/comments/2)
- [remotely assist linux can't boot](doc/remotely-assist-linux-cant-boot.md)
- [ubuntu pendrive custom kernel arg](doc/ubuntu-pendrive-custom-kernel-arg.md)
- [flash win bootable pendrive](https://github.com/slacka/WoeUSB)
- [monitor disk temperature](https://github.com/devel0/linux-scripts-utils/blob/7258d4e2d534e22311323d9b4ac7c7a9224a9637/selfcheck-disk-temp)
- [tune inotify](doc/tune-inotify.md)    
- [fix dual boot](https://askubuntu.com/questions/88384/how-can-i-repair-grub-how-to-get-ubuntu-back-after-installing-windows?answertab=votes#tab-top)
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
  - show process memory graph `smem --pie=name`
  - [process management](doc/process-management.md) 
  - [autorespawn process using supervisor](https://github.com/devel0/dynamic-firewall/tree/e15ce9d0e152dee37a6a5dfff9a5f543914d5c6f#config-supervisor)
  - show memoy usage `smem --pie name -s rss`
- ubuntu tune
  - [ubuntu 18.04](doc/ubuntu-18.04-tune.md)
  - [ubuntu 19.04](doc/ubuntu-19.04-tune.md)
- virtualization
  - [virsh storage](doc/virsh-storage.md)
  - [virtualbox](doc/virtualbox.md)
- remove desktop
  - fix `Authentication Required to Create Managed Color Device` [ref](https://c-nergy.be/blog/?p=12073)
- [rsyslog strip](doc/rsyslog-strip.md)
- driver
  - [card reader](doc/card-reader.md)
  - [bit4id minilector evo driver 64bit](doc/bit4id-minilector-evo.md)
  - [wacom inkscape pressure](doc/wacom-inkscape-pressure.md)
  - [epson scanner gt-s50](doc/driver-epson-gt-s50.md)
- disks
  - raid
    - [autotune raid reconstruction speed](https://github.com/devel0/linux-scripts-utils/blob/18997d280d0bcd435c263d914ea7c1bcffc3a4fd/raid-auto-speed)
    - [raid management](doc/raid-management.md)
    - [replace raid md damaged disk](doc/replace-raid-md-damaged-disk.md)    
  - [loopback devices](doc/loopback-device.md)
  - monitor disks activity `iostat -dx 5`
  - [create bootable iso](https://raw.githubusercontent.com/jsamr/bootiso/master/bootiso)  
  - force reread partition : `partprobe <device>`
  - [create uefi usb from iso](doc/create-uefi-usb-from-iso.md)
  - [encrypt disk](doc/encrypt-disk.md)
  - [selfcheck disk health](doc/selfcheck-disk-health.md)
  - disk space analyzer `apt install baobab`
- docker containers
  - [docker registry](doc/docker-registry.md)
  - [docker without iptables](doc/docker-without-iptables.md)
  - [docker backup](doc/docker-backup.md)
  - [show layer commands](doc/show-layer-commands.md)  
  - doc not included ( see `/etc/dpkg/dpkg.cfg.d/excludes` )
  - [test swap memory](doc/test-swap-memory.md)
  - [scripts](https://github.com/devel0/linux-scripts-utils) ( dk-id, dk-purge-log, dk-net, ... )    

### security
- [iptables firewall](https://github.com/devel0/linux-scripts-utils/blob/ba388ae1e5a0b158cdf83f7d067318b9caccf203/fw.sh)
- [generate htpasswd](doc/generate-htpasswd.md)
- [show cert info](https://github.com/devel0/linux-scripts-utils/blob/master/show-cert-info)
- [id_rsa](doc/id_rsa.md)  
- [ssh client alive](doc/ssh-keep-alive.md)
- upgrade letsencrypt `apt upgrade certbot python3-acme`

### mobile native
- [intellij android studio](doc/intellij-android-studio.md)
- [android push notify](doc/android-push-notify.md)

### tools
- [cygwin install](doc/cygwin-install.md)    
- [win10 quick assist](doc/win10-quick-assist.md)
- [draftsight troubleshoot](doc/draftsight-troubleshoot.md)
- document
  - [nano editor](doc/nano-editor.md)
  - [hex editor : bless](https://github.com/bwrsandman/Bless)
  - [markdown toc](doc/markdown-toc.md)
  - [markdown to pdf](doc/markdown-to-pdf.md)
  - [markdown server](https://github.com/markserv/markserv)
  
### media
- editing
  - pdf edit inking `apt install xournal`
- sound
  - console player `apt install mocp`
- graphics
  - [test 3d working](doc/test-3d-working.md)
  - [qrcode](doc/qrcode.md)  
  - [screen cast](doc/screen-cast.md)
  - [freecad troubleshoot svg import](doc/freecad-import-svg-segmentation-fault.md)
  - [resize image](doc/resize-image.md)  
  - [video transcoding](doc/video-transcoding.md)
  - [remove image exif](doc/remove-image-exif.md)
  - ubuntu cast to chromecst `apt install mkchromecast`
