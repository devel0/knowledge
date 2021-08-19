# knowledge

references for linux admin and development 

<hr/>

## TOC

- [electronics](#electronics)
- [general development](#general-development)
- [math](#math)
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
  - vscode arduino platformio
    - [atmega328](doc/vscode-arduino-platformio-atmega328.md)
    - [atmega8](doc/vscode-arduino-platformio-atmega8.md)
  - [vscode arduino nano platformio](doc/vscode-arduino-nano-platformio.md)
  - [arduino on atmega8](doc/arduino-on-atmega8.md)
  - [atmega power save](doc/atmega-power-save.md)
  - [arduino examine elf](doc/arduino-examine-elf.md)
  - [esp8266 board plugin](https://github.com/esp8266/Arduino#installing-with-boards-manager) ( use `http://arduino.esp8266.com/staging/package_esp8266com_index.json` for development )
  - [esp8266 twi arduino nano problems](doc/esp8266-twi-arduino-nano.md)  
  - [serial baud rate](doc/arduino-serial-baud.md)
- stm32
  - [vscode debugging](https://github.com/devel0/iot-examples/tree/3ff96e5e57c6593675e8f270b87161b9724b6786#stm32duino)
  - [string stream](https://github.com/bblanchon/ArduinoStreamUtils)
- [schematics and pcb editor](doc/easyeda.md)
- [qucs circuit simulator](doc/qucs.md)
- [simulator](http://everycircuit.com)
- [pcb etching](doc/pcb-etching.md)
- [transistor biasing](_files/transistor-biasing.xlsx)  
- [measure usb cable resistance](doc/measure-usb-cable-resistance.md)
- [UM34C linux log](doc/UM34C-linux-log.md)
- [3d print tips](doc/3dprinting-tips.md)

### general development

- [references](https://devhints.io/)

### math

- [c# AngouriMath symbolic](https://github.com/devel0/scurve-speed-eval/blob/0bff63605a3f7fae49d6f56aab4b813efa755242/Program.cs#L54)
- [octave symbolic](doc/octave-symbolic.md)

### shell
- [bash cheat sheet](https://devhints.io/bash)
- [bash scripting](doc/bash-scripting.md)
- [bash array](https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays)
- executing dir `exdir=$(dirname $(readlink -f "$0"))`
- text screencast
  - [ttyrec ttygif](doc/ttyrec-ttygif.md)
  - [asciinema](https://asciinema.org/)
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
- [jq json tool](doc/jq-json-tool.md)
- [ensure kill process](doc/ensure-kill-process.md)
- sed
  - [replace newline](http://www.benjiegillam.com/2011/09/using-sed-to-replace-newlines/)
  - skip first line `cat file | sed -n '1d;p'`
  - delete empty lines `cat file | sed -r '/^\s*$/d'`
- time GMT `TZ=GMT date +@GMT-%Y.%m.%d-%H.%M.%S`
- show dialog notification `notify-send title msg`

### development tools
- [git](doc/git-usage.md)  
- [github git ssh](doc/github-git-ssh.md)
- fast gui diff `fldiff file1 file2`
- [api docfx](https://github.com/dotnet/docfx)
- [mono](https://www.mono-project.com/download/stable/)
- perf
  - [dotnet trace](https://docs.microsoft.com/en-us/dotnet/core/diagnostics/dotnet-trace) (eg. `dotnet-trace collect -p 610959 --format speedscope` then import with speedscope)
- trace x11 (`xtrace -n cmd args`)
- vscode
  - [tips](doc/vscode-tips.md)
  - [keybinding](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf)
  - [fold functions](https://stackoverflow.com/a/54665823/5521766)
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
  - msbuild: `dotnet msbuild`
  - [search pkgs command line](https://github.com/devel0/repros/blob/5b08053bf6a389fe52979ff4e96e4ec31c1501b1/avalonia/test-empty-cpu100/test-empty.csproj#L14)
- [docx documentation generator](doc/docfx-documentation-generator.md)
- [librecalc](doc/librecalc.md)

### csharp
- [send email 465](doc/send-email-465.md)
- [psql ef codefirst](doc/psql-ef-codefirst.md)
- dotnet core
  - [dotnet3 and 5 on ubuntu20.04](doc/dotnet-5-ubuntu20.04.md)
  - [netcore csproj](doc/netcore-csproj.md) ( generate doc, copy to output, define macro, exclude files from compile, disable warnings )
  - [netcore platform environment](doc/netcore-platform-environment.md) ( os type, debug macro )
  - [asp net core](doc/asp-net-core.md)
  - [dotnet sdks](https://github.com/dotnet/core-sdk) - [installers](https://dotnet.microsoft.com/download/dotnet-core)
  - [dotnet cmdline](doc/dotnet-cmdline.md)
  - [dotnet core unix interop](doc/dotnet-core-unix-interop.md)
  - [dotnet gui](doc/dotnet-avalonia.md)
    - avalonia
      - [notes](doc/avalonia-notes.md)
      - [app icon](doc/avalonia-icon.md)
      - [vscode xaml intellisense](https://marketplace.visualstudio.com/items?itemName=rogalmic.vscode-xml-complete)
  - [dotnet netcorestandard testunit](https://github.com/devel0/netcore-util/tree/6267b9e954692ecc7513ccb9616d590128294598#how-this-project-was-built)
  - [troubleshoot](doc/dotnet-troubleshoot.md)
  - view version of dll `exiftool file.dll | grep 'Product Version'`
- [regex](doc/regex.md)
- [csharp to typescript](doc/csharp-to-typescript.md)
- [xlsx finalize worksheet freeze columns](https://github.com/devel0/worked-hours-tracker/blob/e947095bba1c52010651e79fbf2f44d82f600adc/WorkedHoursTrackerWebapi/Controllers/ApiController.cs#L543-L557)
- [wpf](doc/wpf.md)
- [tuple value read write](doc/tuple-value-read-write.md)
- [read from special serial ttyACM cdc type](https://www.vgies.com/a-reliable-serial-port-in-c/)
- [c# coding standards](https://github.com/justinamiller/Coding-Standards)

### c++
- [linux vscode debug](https://github.com/devel0/example-vscode-linux-cpp-debug)
- [dump-file-to-c](doc/dump-file-to-c.md)  

### database
- postgres
  - [create psql container](doc/create-pgsql-container.md)
  - [backup restore](doc/psql-backup-restore.md)
  - [password in file](doc/psql-password-in-file.md)
  - [select datetime timezone](doc/select-datetime-timezone.md)
  - [pgadmin](doc/pgadmin.md)
  - [index array](doc/psql-array-index.md)
- diagramming schema
  - [schema crawler](doc/psql-schema-crawler.md)
  - [automatic generate psql db diagram](https://github.com/cbbrowne/autodoc)
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
  - [troubleshoot](doc/react-typescript-troubleshoot.md)
- react / material.ui ( typescript )
  - create react typescript `yarn create react-app my-app --template typescript`
  - [app skeleton and global states](https://github.com/devel0/example-react-global-state)
  - [create react library useHook error](https://github.com/transitive-bullshit/create-react-library/issues/99#issuecomment-463177704)
  - [resposive drawer with styles and theme](doc/material-ui-responsive-drawer-styles-theme-typescript.md)
  - [common styles combined](https://github.com/mui-org/material-ui/issues/11517#issuecomment-478337616)

### networking
- send a tcp packet `echo sample | nc 10.10.2.10 1000`
- test tcp port `echo "test" | netcat -w 5 -W 1 host port ; if [ "$?" == "0" ]; then echo "OK"; else echo "UNREACHABLE"; fi`
- [test webapi](doc/test-webapi.md)
- [send simple message over udp](doc/send-simple-message-over-udp.md)
- [send email](doc/send-email-wrapper.md)
- [tune nginx for webapi](doc/nginx-webapi-conf.md)  
- wireshark
  - [run wireshark as nonroot](doc/run-wireshark-as-nonroot.md)      
  - [wireshark chrome decrypt ssl](doc/wireshark-chrome-decrypt-ssl.md)
- [https proxy sniffer](doc/https-proxy-sniffer.md)
- [xrdp remmina](doc/xrdp-remmina.md)  
- zimbra
  - [force smtp auth](doc/zimbra-force-smtp-auth.md)
  - [backup/restore mailbox](doc/zimbra-backup.md)
- [mobile server](doc/mobile-server.md)
- monitor interfaces bandwidth `bmon -p eth0,eth1` or `nload -m`
- quick list interface addresses `ip -br a`
- [ethernet cabling T568B](http://www.comnen.com/whats-the-difference-between-t568a-and-t568b/)
- scan hostnames `nmap -sn addr/mask`
- [bluetooth](doc/bluetooth.md)
- [tcpdump examples](https://danielmiessler.com/study/tcpdump/)
- [https client with esp8266](doc/https-esp8266.md)

### python

- plotting
  - [plot 2d 2var function](doc/python-plot-2d-2var.md)
- calc
  - [solve eq](doc/python-solve-eq.md)

### linux
- server
  - [quick and dirty os install notes](doc/quick-and-dirty-server-install-notes.md)
  - [resize lvm cache in favor of swap partition](doc/resize-lvm-cache.md)
  - [ubuntu server post install](doc/ubuntu-server-post-install.md)  
  - [custom boot script](doc/custom-boot-script.md)
- gnome
  - [shell extension with bash](https://github.com/p-e-w/argos)
  - [fix sort icon direction](https://bugs.launchpad.net/ubuntu/+source/gtk+3.0/+bug/1840516/comments/2)
  - [custom open with](doc/custom-open-with.md)
  - [desktop icons](doc/ubuntu-desktop-icons.md)
  - [gnome bookmarks](doc/gnome-bookmarks.md)
  - reload shell with top panel `killall gnome-shell`
  - always on top `apt install compiz-plugins`
- [remotely assist linux can't boot](doc/remotely-assist-linux-cant-boot.md)
- [ubuntu pendrive custom kernel arg](doc/ubuntu-pendrive-custom-kernel-arg.md)
- [flash win bootable pendrive](https://github.com/slacka/WoeUSB)
- [monitor disk temperature](https://github.com/devel0/linux-scripts-utils/blob/7258d4e2d534e22311323d9b4ac7c7a9224a9637/selfcheck-disk-temp)
- [tune inotify](doc/tune-inotify.md)    
- [disable oom killer](https://superuser.com/a/1150229)
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
  - retrieve list of upgradable packages `apt list --upgradable`
  - retrieve version current and older `apt-cache policy package`
  - install old version `apt-get install package=version`
- processes  
  - show process memory graph `smem --pie=name`
  - [process management](doc/process-management.md) 
  - [autorespawn process using supervisor](https://github.com/devel0/dynamic-firewall/tree/e15ce9d0e152dee37a6a5dfff9a5f543914d5c6f#config-supervisor)
  - show memoy usage `smem --pie name -s rss`
- ubuntu tune
  - [ubuntu 20.04 tuf gx505](doc/ubuntu20.04-tuf-gx505.md)
  - [ubuntu 20.04 asus P2550](doc/ubuntu20.04-P2550.md)  
  - [disable tracker miner](https://www.linuxuprising.com/2019/07/how-to-completely-disable-tracker.html)
  - [ubuntu 19.04](doc/ubuntu-19.04-tune.md)
  - [ubuntu 18.04](doc/ubuntu-18.04-tune.md)
- virtualization
  - [virsh storage](doc/virsh-storage.md)
  - [virtualbox](doc/virtualbox.md)
- remove desktop
  - fix `Authentication Required to Create Managed Color Device` [ref](https://c-nergy.be/blog/?p=12073)
- [rsyslog strip](doc/rsyslog-strip.md)
- devices
  - [card reader](doc/card-reader.md)
  - [bit4id minilector evo driver 64bit](doc/bit4id-minilector-evo.md)
  - [wacom inkscape pressure](doc/wacom-inkscape-pressure.md)
  - [epson scanner gt-s50](doc/driver-epson-gt-s50.md)
  - view usb devices hierarchy `lsbusb -tv`
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
  - [add xrdp to docker container](doc/add-rdp-to-docker-container.md)
- show battery level `cat /sys/class/power_supply/BAT0/capacity`
- [nextcloud tips](doc/nextcloud.md)

### security
- [iptables firewall](https://github.com/devel0/linux-scripts-utils/blob/ba388ae1e5a0b158cdf83f7d067318b9caccf203/fw.sh)
- [generate htpasswd](doc/generate-htpasswd.md)
- [cert management](doc/cert-management.md)
- [id_rsa](doc/id_rsa.md)  
- [ssh client alive](doc/ssh-keep-alive.md)
- upgrade letsencrypt `apt upgrade certbot python3-acme`

### mobile native
- [intellij android studio](doc/intellij-android-studio.md)
- [android push notify](doc/android-push-notify.md)

### tools
- [cygwin install](doc/cygwin-install.md)    
- [win10 quick assist](doc/win10-quick-assist.md)
- drawings
  - [dwg viewer](doc/dwg-viewer-linux.md)
  - [dxf editor qcad](https://www.qcad.org/en/)
  - [draftsight troubleshoot](doc/draftsight-troubleshoot.md)
- document
  - [xlsx](doc/xlsx.md)
  - [nano editor](doc/nano-editor.md)
  - [github latex math](https://gist.github.com/a-rodin/fef3f543412d6e1ec5b6cf55bf197d7b)
  - [hex editor : bless](https://github.com/bwrsandman/Bless)
  - [markdown refs](doc/markdown-refs.md)
  - [markdown toc](doc/markdown-toc.md)
  - [markdown to pdf](doc/markdown-to-pdf.md)
  - [markdown server](https://github.com/markserv/markserv)
  - [useful unicode](doc/useful-unicode.md)  
  - google drive direct link `https://drive.google.com/uc?export=download&id=DRIVE_FILE_ID`
  
### media
- editing
  - pdf edit inking `apt install xournal`
  - [pdf join into single page](doc/pdf-join-into-single-page.md)
  - convert jpg to pdf `convert *.jpg -auto-orient out.pdf`
- sound
  - console player `apt install mocp`
- graphics
  - [test 3d working](doc/test-3d-working.md)
  - [qrcode](doc/qrcode.md)  
  - [screen cast](doc/screen-cast.md)
  - freecad
    - [troubleshoot svg import](doc/freecad-import-svg-segmentation-fault.md)
    - [formula reference](doc/freecad-formula-reference.md)
  - image info `identify image.jpg`
  - crop image `convert input.jpg -crop wxh+x+y out.jpg`
  - [resize image](doc/resize-image.md)  
  - [video transcoding](doc/video-transcoding.md)
  - [remove image exif](doc/remove-image-exif.md)
  - [grab screen to image](doc/grab-screen-to-image.md)
  - ubuntu cast to chromecst `apt install mkchromecast`
- misc
  - [stream dvbt to chromecast](doc/stream-dvbt-to-chromecast.md)
