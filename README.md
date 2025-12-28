# knowledge

references for linux admin and development 

<hr/>

- [ai misc](#ai-misc)
- [csharp](#csharp)
- [shell](#shell)
- [development tools](#development-tools)
- [c++](#c)
- [database](#database)
- [webdevel](#webdevel)
- [electronics](#electronics)
- [general development](#general-development)
- [gis](#gis)
- [math](#math)
- [sysadm](#sysadm)
- [networking](#networking)
- [python](#python)
- [linux](#linux)
- [security](#security)
- [mobile native](#mobile-native)
- [tools](#tools)
- [media](#media)


<hr/>

## ai misc

- angular
  - [angular rxjs best practice change field of an object directly on the behaviorsubject then call next or work on a clone then next](./ai-doc/angular_rxjs_best_practice_change_field_of_an_obje_1766506347476.pdf)
  - [angular set multiple behaviorsubject at once](./ai-doc/angular_set_multiple_behaviorsubject_at_once_1766509354111.pdf)
  - [angular pipe recompute on rxjs event](./ai-doc/angular_pipe_recompute_on_rxjs_event_1766759874216.pdf)
  - [angular prevent dialog from close clock outside](./ai-doc/angular_prevent_dialog_from_close_click_outside_1766778919699.pdf)
  - [angular directive to track size and position of an element included begin values and margins](./ai-doc/angular_directive_to_track_size_and_position_of_an_1766848276692.pdf)
- typescript
  - [typescript full qualify Map type name](./ai-doc/typescript_full_qualify_map_type_name_1766659794237.pdf)  

## csharp

- [language notes](doc/csharp.md)
- [send email 465](doc/send-email-465.md)
- [dotnet scripts](doc/dotnet-scripts.md)
- [member not null](doc/csharp-member-not-null.md)
- [task programming](doc/task-programming.md)
- dotnet core
  - publish self contained `dotnet publish -c Release --runtime linux-x64 --sc`
  - [dotnet3 and 5 on ubuntu20.04](doc/dotnet-5-ubuntu20.04.md)
  - [dotnet6 and 7 on ubuntu24.04](doc/dotnet-6-7-ubuntu24.04.md)
  - [netcore csproj](doc/netcore-csproj.md) ( generate doc, copy to output, define macro, exclude files from compile, disable warnings )
  - [test coverage](https://github.com/devel0/netcore-sci/tree/8595fb5475df6f008b4c2a478683990b34e09b03?tab=readme-ov-file#unit-tests)
  - view unit test output logger : open `Output` and select `C# Dev Kit - Test Explorer`
  - [netcore platform environment](doc/netcore-platform-environment.md) ( os type, debug macro )
  - [asp net core](doc/asp-net-core.md)
  - [dotnet sdks](https://github.com/dotnet/core-sdk) - [installers](https://dotnet.microsoft.com/download/dotnet-core)
  - [dotnet cmdline](doc/dotnet-cmdline.md)
  - [dotnet core unix interop](doc/dotnet-core-unix-interop.md)
  - [dotnet gui](doc/dotnet-avalonia.md)
    - [uno](doc/uno.md)
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
- [trap ctrl+c](doc/csharp-trap-ctrl-c.md)
- [c# coding standards](https://github.com/justinamiller/Coding-Standards)
- ef core
  - disable validation for some prop `[ValidateNever]` attribute
  - [psql ef codefirst](doc/psql-ef-codefirst.md)
  - [transaction](doc/ef-core-transaction.md)
- opengl
  - [silk net under virtualbox opengl3.3](https://github.com/dotnet/Silk.NET/issues/246#issuecomment-1296368494)
- [user secrets](doc/csharp-user-secrets.md)

## shell

- bash
  - [bash scripting](doc/bash-scripting.md)
  - [bash locale](doc/bash-locale.md)
  - [prompt colors](doc/prompt-colors.md)
- executing dir in bash script `exdir=$(dirname "$(readlink -f "$BASH_SOURCE")")`
- text screencast
  - [ttyrec ttygif](doc/ttyrec-ttygif.md)
  - [asciinema](https://asciinema.org/)
- find files sorted by size `find -type f -name "*.pdf" -printf '%s\t%p\n' | sort -nr | less`
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
- ls in mb `ls -la --block-size=MB`
- monitor progress of pipe `cat /dev/random  | pv > /dev/null`
- sed
  - [replace newline](http://www.benjiegillam.com/2011/09/using-sed-to-replace-newlines/)
  - skip first line `cat file | sed -n '1d;p'`
  - skip line range `sed A,Bd file` ( skip lines with index range [A,B] )
  - delete empty lines `cat file | sed -r '/^\s*$/d'`
- time
  - GMT `TZ=GMT date +@GMT-%Y.%m.%d-%H.%M.%S`
  - time from unixtime `date -d @VALUE`
- show dialog notification `notify-send title msg`
- [short uuid](https://codesandbox.io/s/flamboyant-jasper-eby0cz?file=/src/App.js)

## development tools

- [opensource dev](doc/opensource-dev.md)
- git
  - [git](doc/git-usage.md)  
  - [git animate](https://gource.io/)
  - [github git ssh](doc/github-git-ssh.md)
- [run github action workflows locally](https://github.com/nektos/act)
- fast gui diff `fldiff file1 file2`
- [api docfx](https://github.com/dotnet/docfx)
- [mono](https://www.mono-project.com/download/stable/)
- perf
  - [dotnet trace](doc/dotnet-trace.md)
  - trace x11 (`xtrace -n cmd args`)
- vscode
  - [tips](doc/vscode-tips.md)
  - [keybinding](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf)
  - [fold functions](https://stackoverflow.com/a/54665823/5521766)
  - [settings](doc/vscode-settings.md)
  - [useful extensions](doc/vscode-useful-extensions.md)
  - [troubleshoot](doc/vscode-troubleshoot.md)
  - [react debug chrome](doc/vscode-react-debug-chrome.md)
  - [debug firefox](doc/vscode-debug-firefox.md)  
  - [show external code](doc/vscode-show-external-code.md)
  - [remote host through docker](doc/vscode-through-docker.md)
- [gnome development](doc/gnome-development.md)
- nuget
  - [linux-install](doc/nuget-linux-install.md)
  - [local packages](doc/nuget-config-local-packages.md)
  - [troubleshoot](doc/troubleshoot.md)
  - msbuild: `dotnet msbuild`
  - [search pkgs command line](https://github.com/devel0/repros/blob/5b08053bf6a389fe52979ff4e96e4ec31c1501b1/avalonia/test-empty-cpu100/test-empty.csproj#L14)
- [docx documentation generator](doc/docfx-documentation-generator.md)
- [librecalc](doc/librecalc.md)
- dump c++ symbols from .so lib `nm -gDC LIB.so`
- graphics
  - [gnuplot](doc/gnuplot.md)
  - debug opengl programs `apt install renderdoc`  
- get PID from window `xprop | awk '/PID/ {print $3}'`
- limit cpu `apt install cpulimit ; cpulimit -p PID -l 5` ( limit process PID to 5% )

## c++

- [clang format](./_files/.clang-format)
- [linux vscode debug](https://github.com/devel0/example-vscode-linux-cpp-debug)
- [dump-file-to-c](doc/dump-file-to-c.md)  

## database

- [System.Linq.Dynamic.Core](doc/system-linq-dynamic-core.md)
- [create db server using docker](doc/docker-db-server.md)
- postgres
  - [create psql container](doc/create-pgsql-container.md)
  - [backup restore](doc/psql-backup-restore.md)
  - [password in file](doc/psql-password-in-file.md)
  - [select datetime timezone](doc/select-datetime-timezone.md)
  - pgadmin install `docker run --restart=unless-stopped --name=pgadmin -p 8080:80     -e 'PGADMIN_DEFAULT_EMAIL=email'     -e 'PGADMIN_DEFAULT_PASSWORD=pass'     -d dpage/pgadmin4`
  - [index array](doc/psql-array-index.md)
  - [sequence schema](doc/psql-sequences.md)
  - [create db and assign user](doc/psql-create-db-user.md)
- mssql
  - [docker local mssql server](doc/docker-local-mssql.md)
- diagramming schema
  - [schema crawler](doc/psql-schema-crawler.md)
  - [automatic generate psql db diagram](https://github.com/cbbrowne/autodoc)
- entity framework
  - [load related entities](https://docs.microsoft.com/en-us/ef/core/querying/related-data)

## webdevel

- [odata](https://www.odata.org/documentation/)
- [ts hello world](doc/ts-hello-world.md)
- [javascript/jquery](doc/javascript-jquery.md)
  - [momentjs date](doc/momentjs-date.md)
- [bootstrap css](doc/bootstrap-css.md)
- [sandbox repro](doc/sandbox-repro.md)
- [chrome](doc/chrome.md)
- imagemap ( just use gimp Filters/Web/Imagemap )
- [grunt troubleshoot](doc/grunt-troubleshoot.md)
- css
  - padding 1-4 values
    - 1 value ( all sides equal )
    - 2 value ( top/bottom left/right )
    - 3 value ( top left/right bottom )
    - 4 value ( top, right, bottom, left )
- npm
  - [tips](doc/npm-tips.md)
  - [proxy cache](doc/npm-proxy-cache.md)  
- typescript
  - [create console app](https://github.com/devel0/skeleton-ts)
  - support for optional chaining conditional `?` operator (upgrade `react-scripts` to `3.3.0`)
  - [troubleshoot](doc/react-typescript-troubleshoot.md)
- react / material.ui ( typescript )
  - [examples](https://github.com/devel0/examples-react)
  - [snippets](doc/react-snippets.md)
  - create react typescript `npm create vite@latest test-app -- --template react-ts`
  - [app skeleton and global states](https://github.com/devel0/example-react-global-state)
  - [create react library useHook error](https://github.com/transitive-bullshit/create-react-library/issues/99#issuecomment-463177704)
  - [resposive drawer with styles and theme](doc/material-ui-responsive-drawer-styles-theme-typescript.md)
  - [common styles combined](https://github.com/mui-org/material-ui/issues/11517#issuecomment-478337616)

## electronics

- arduino
  - [vscode arduino](doc/vscode-arduino.md)
  - vscode arduino platformio
    - [atmega328](doc/vscode-arduino-platformio-atmega328.md)
    - [atmega8](doc/vscode-arduino-platformio-atmega8.md)
    - [platformio troubleshoot](doc/platformio-troubleshoot.md)  
  - [vscode arduino nano platformio](doc/vscode-arduino-nano-platformio.md)
  - [arduino on atmega8](doc/arduino-on-atmega8.md)
  - [atmega power save](doc/atmega-power-save.md)
  - [arduino examine elf](doc/arduino-examine-elf.md)
  - [esp8266 board plugin](https://github.com/esp8266/Arduino#installing-with-boards-manager) ( use `http://arduino.esp8266.com/staging/package_esp8266com_index.json` for development )
  - [esp8266 twi arduino nano problems](doc/esp8266-twi-arduino-nano.md)  
  - [esp8266 tips](doc/esp8266-tips.md)
  - [serial baud rate](doc/arduino-serial-baud.md)
- stm32
  - [vscode debugging](https://github.com/devel0/iot-examples/tree/3ff96e5e57c6593675e8f270b87161b9724b6786#stm32duino)
  - [string stream](https://github.com/bblanchon/ArduinoStreamUtils)
  - [tips](doc/stm32tips.md)
  - [multiple devices](doc/stm32-multiple.md)
- [schematics and pcb editor](doc/easyeda.md)
- circuit simulator
  - [circuitjs](http://lushprojects.com/circuitjs/circuitjs.html?)
  - [qucs](doc/qucs.md)
  - [everycircuit](http://everycircuit.com)
- [pcb etching](doc/pcb-etching.md)
- [transistor biasing](_files/transistor-biasing.xlsx)  
- [measure usb cable resistance](doc/measure-usb-cable-resistance.md)
- [UM34C linux log](doc/UM34C-linux-log.md)
- [3d print tips](doc/3dprinting-tips.md)

## general development

- [references](https://devhints.io/)

## gis

- [geojson](https://www.geoapify.com/geojson-javascript-developer-guide)

## math

- [c# AngouriMath symbolic](https://github.com/devel0/scurve-speed-eval/blob/0bff63605a3f7fae49d6f56aab4b813efa755242/Program.cs#L54)
- [octave symbolic](doc/octave-symbolic.md)

## sysadm

- [backup imap](https://github.com/joeyates/imap-backup)
- [boot win phydisk](./doc/virt-manager-boot-win-phydisk.md)

## networking

- [wired hotspot](https://github.com/devel0/linux-scripts-utils/blob/master/enable-wiredhotspot)
- get current public ip address `curl -s ifconfig.me`
- [netplan yaml ref](https://netplan.readthedocs.io/en/latest/netplan-yaml/)
- [ubuntu desktop disable network manager](doc/ubuntu-desktop-disable-network-manager.md)
- ssh
  - [ssh port forward](doc/ssh-port-forward.md)
  - [ssh mount dir](doc/ssh-mount-dir.md)
- send a tcp packet `echo sample | nc 10.10.2.10 1000`
- test tcp port `echo "test" | netcat -w 5 -W 1 host port ; if [ "$?" == "0" ]; then echo "OK"; else echo "UNREACHABLE"; fi`
- [test webapi](doc/test-webapi.md)
- [send simple message over udp](doc/send-simple-message-over-udp.md)
- [send email](doc/send-email-wrapper.md)
- nginx
  - [tune nginx for webapi](doc/nginx-webapi-conf.md)  
  - [exec shell script with fastcgi](doc/nginx-fastcgi.md)
- wireshark
  - [run wireshark as nonroot](doc/run-wireshark-as-nonroot.md)      
  - [wireshark chrome decrypt ssl](doc/wireshark-chrome-decrypt-ssl.md)
- [https proxy sniffer](doc/https-proxy-sniffer.md)
- [xrdp remmina](doc/xrdp-remmina.md)
- zimbra
  - [force smtp auth](doc/zimbra-force-smtp-auth.md)
  - [backup/restore mailbox](doc/zimbra-backup.md)
- [mobile server](doc/mobile-server.md)
- samba
  - get ip from netbios name `nmblookup <name>`
  - scan netbios name in net `nbtscan <netaddr>`
- monitor interfaces bandwidth `bmon -p eth0,eth1` or `nload -m`
- quick list interface addresses `ip -br a`
- [ethernet cabling T568A T568B](https://www.flukenetworks.com/sites/default/files/default/net-240450-en-global-t568a-t568b-comparison-diagram-1500x1000_0.jpg)
- scan hostnames `nmap -sn addr/mask`
- [bluetooth](doc/bluetooth.md)
- tcpdump  
  - [cheat sheet](https://cdn.comparitech.com/wp-content/uploads/2019/06/tcpdump-cheat-sheet-2.pdf)
  - [examples](https://danielmiessler.com/study/tcpdump/)
- [cert fingerprint](doc/cert-fingerprint.md)
- retrieve bandwidth utilization continously for given interface with `ifstat -i devname`
- download remote http folder `wget -r --no-parent URL`
- [x11vnc headless](./doc/x11vnc-headless.md)

## python

- plotting
  - [plot 2d 2var function](doc/python-plot-2d-2var.md)
- calc
  - [solve eq](doc/python-solve-eq.md)

## linux

- server
  - [quick and dirty virtualized vlan os install notes](doc/quick-and-dirty-virtualized-vlan-server-install.md)
  - [quick and dirty os install notes](doc/quick-and-dirty-server-install-notes.md)  
  - [prevent unattended upgrades](doc/prevent-unattended-upgrades.md)
  - [resize lvm cache in favor of swap partition](doc/resize-lvm-cache.md)
  - [ubuntu server post install](doc/ubuntu-server-post-install.md)  
  - [custom boot script](doc/custom-boot-script.md)
  - [disable sleep](https://www.unixtutorial.org/disable-sleep-on-ubuntu-server/)
  - [systemd services](doc/systemd-service.md)
  - [zfs](doc/zfs.md)
  - [how much is wear ssd](doc/ssd-wear.md)
  - [netfilter](https://en.wikipedia.org/wiki/Netfilter#)
  - [self signed cert](doc/self-signed-cert.md)
  - [journalctl](doc/journalctl.md)
  - [crontab](doc/crontab.md)
  - [wake-on-lan](doc/wake-on-lan.md)
  - test cpu speed `apt install sysbench ; sysbench cpu run` then see events per seconds ( higher better )  
  - [detached screen](doc/detached-screen.md)
  - [nfs4 acl](doc/nfs4-acl.md)
  - [chroot env](doc/chroot-env.md)
  - [rescue notes](doc/rescue.md)
- kde
  - [disable input method completion](doc/kde-disable-input-method-completion.md)
- gnome
  - [shell extension with bash](https://github.com/p-e-w/argos)
  - [fix sort icon direction](https://bugs.launchpad.net/ubuntu/+source/gtk+3.0/+bug/1840516/comments/2)
  - [custom open with](doc/custom-open-with.md)
  - [desktop icons](doc/ubuntu-desktop-icons.md)
  - [gnome bookmarks](doc/gnome-bookmarks.md)
  - reload shell with top panel `killall gnome-shell`
  - always on top `apt install compiz-plugins`
  - chrome freeze when attach files ( could try `apt install xdg-desktop-portal-gnome` to change file dialog )
- devices
  - cpu bench `sysbench --threads="$(nproc)" cpu run`
  - [kubuntu enable touchpad tapping](https://askubuntu.com/a/1180254/766220)
  - [udev rules](doc/udev-rules.md)
  - nautilus file manager folder right click -> open in terminal `apt install nautilus-open-terminal`
  - hardware inventory `inxi`
  - minisforum UM773 LITE - F7BFD [graphics drivers](https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/docs/install/installryz/native_linux/install-ryzen.html)
- log
  - [tail generic color](https://github.com/devel0/cf)
  - colourized log `grc --colour=on tail -f /var/log/syslog`
  - grep only in file pattern `grep -r --include="*.EXT" <search-string> <beginpath>`
  - [tail grep continous](doc/tail-grep-continuous.md)
  - [force log rotate](doc/force-log-rotate.md)  
- [remotely assist linux can't boot](doc/remotely-assist-linux-cant-boot.md)
- [ubuntu pendrive custom kernel arg](doc/ubuntu-pendrive-custom-kernel-arg.md)
- [flash win bootable pendrive](https://github.com/slacka/WoeUSB)
- [monitor disk temperature](https://github.com/devel0/linux-scripts-utils/blob/7258d4e2d534e22311323d9b4ac7c7a9224a9637/selfcheck-disk-temp)
- [tune inotify watches](doc/tune-inotify.md)    
- [disable oom killer](https://superuser.com/a/1150229)
- [fix dual boot](https://askubuntu.com/questions/88384/how-can-i-repair-grub-how-to-get-ubuntu-back-after-installing-windows?answertab=votes#tab-top)
- [su with sudo colorful prompt](doc/su-with-sudo-prompt.md)  
- [i18n decimal separator dot](doc/decimal-separator-dot.md)  
- [draftsight open dxf](doc/draftsight-open-with-dxf.md)
- packages
  - [packages build dep](doc/build-dep.md)  
  - [dpkg](doc/dpkg.md)  
  - upgrade single package `apt-get install --only-upgrade package`  
  - retrieve list of upgradable packages `apt list --upgradable`
  - retrieve version current and older `apt-cache policy package`
  - install old version `apt-get install package=version`
- processes  
  - show process memory graph `smem --pie=name`
  - [process management](doc/process-management.md) 
  - [autorespawn process using supervisor](doc/supervisor.md)
  - show memoy usage `smem --pie name -s rss`
- ubuntu tune
  - [locale and timezone](doc/ubuntu-locale-and-timezone.md)
  - [kubuntu 22.04](doc/kubuntu-22.04.md)
  - [ubuntu 22.04 tune](doc/ubuntu-22.04-tune.md)
  - [ubuntu 20.04 tuf gx505](doc/ubuntu20.04-tuf-gx505.md)
  - [ubuntu 20.04 asus P2550](doc/ubuntu20.04-P2550.md)  
  - [disable tracker miner](https://www.linuxuprising.com/2019/07/how-to-completely-disable-tracker.html)
  - [ubuntu 19.04](doc/ubuntu-19.04-tune.md)
  - [ubuntu 18.04](doc/ubuntu-18.04-tune.md)  
  - directory color on dark theme, set `/etc/bash.bashrc` with `export LS_COLORS='di=0;34:ow=1;34'`
- virtualization
  - [virsh storage](doc/virsh-storage.md)  
  - [virsh tips and backup](doc/virsh.md)
  - [virtualbox](doc/virtualbox.md)
  - [set virtualbox guest motherboard-cpu-id](doc/virtualbox-motherboard-cpu-id.md)
  - copy qcow2 over network `rsync --sparse --inplace -zv --progress src.qcow2 dst:folder`
- remove desktop
  - fix `Authentication Required to Create Managed Color Device` [ref](https://c-nergy.be/blog/?p=12073)
- [strip log](doc/strip-log.md)
- devices
  - [card reader](doc/card-reader.md)
  - [bit4id minilector evo driver 64bit](doc/bit4id-minilector-evo.md)
  - [wacom inkscape pressure](doc/wacom-inkscape-pressure.md)
  - [epson scanner gt-s50](doc/driver-epson-gt-s50.md)
  - [usb and udev](doc/usb-and-udev.md)  
- disks
  - raid
    - [autotune raid reconstruction speed](https://github.com/devel0/linux-scripts-utils/blob/18997d280d0bcd435c263d914ea7c1bcffc3a4fd/raid-auto-speed)
    - [raid management](doc/raid-management.md)
    - [replace raid md damaged disk](doc/replace-raid-md-damaged-disk.md)    
  - [loopback devices](doc/loopback-device.md)
  - monitor disks activity `iostat -dx 5` or for device (mb/s) `iostat -sm -p /dev/DEVICE 1`
  - [create bootable iso](https://raw.githubusercontent.com/jsamr/bootiso/master/bootiso)  
  - force reread partition : `partprobe <device>`
  - [create uefi usb from iso](doc/create-uefi-usb-from-iso.md)
  - [encrypt disk](doc/encrypt-disk.md)
  - [selfcheck disk health](doc/selfcheck-disk-health.md)
  - disk space analyzer `apt install baobab`
  - compare two directories `diff -rq DIR1 DIR2`
- files
  - search duplicate files `find . ! -empty -type f -exec md5sum {} + | sort | uniq -w32 -dD > dupfiles.txt`
- docker containers
  - [docker xwindows](doc/docker-xwindows.md)
  - [modify created docker env](doc/docker-created-modify-env.md)
  - [docker buildx](doc/docker-buildx.md)
  - [docker registry](doc/docker-registry.md)
  - [docker without iptables](doc/docker-without-iptables.md)
  - [docker backup](doc/docker-backup.md)
  - [show layer commands](doc/show-layer-commands.md)  
  - doc not included ( see `/etc/dpkg/dpkg.cfg.d/excludes` )
  - [test swap memory](doc/test-swap-memory.md)
  - [scripts](https://github.com/devel0/linux-scripts-utils) ( dk-id, dk-purge-log, dk-net, ... )    
  - [add xrdp to docker container](doc/add-rdp-to-docker-container.md)
  - [btrfs tools](doc/btrfs-tools.md)
  - tail log continously `docker logs -f CONTAINER | grep --line-buffered -ia WORD`
  - [run gitlab ci from terminal](https://stackoverflow.com/a/65920577/5521766)
- [battery nfo](doc/battery-nfo.md)
- nextcloud
  - [tips](doc/nextcloud.md)
  - [rclone](doc/rclone.md)
- [fonts](doc/fonts.md)
- general
  - [firefox](doc/firefox.md)

## security

- [gpg](doc/gpg.md)
- [iptables firewall](https://github.com/devel0/linux-scripts-utils/blob/ba388ae1e5a0b158cdf83f7d067318b9caccf203/fw.sh)
- [generate htpasswd](doc/generate-htpasswd.md)
- [cert management](doc/cert-management.md)
- [id_rsa](doc/id_rsa.md)  
- [ssh client alive](doc/ssh-keep-alive.md)
- [letsencrypt acme dns](doc/letsencrypt-acme-dns.md)
- [fail2ban](doc/fail2ban.md)
- [passbolt](./doc/passbolt-docker-recover-user.md)

## mobile native

- [intellij android studio](doc/intellij-android-studio.md)
- [android push notify](doc/android-push-notify.md)

## tools

- [cygwin install](doc/cygwin-install.md)    
- [win10 quick assist](doc/win10-quick-assist.md)
- drawings
  - [dwg viewer](doc/dwg-viewer-linux.md)
  - [dxf editor qcad](https://www.qcad.org/en/)
  - [draftsight troubleshoot](doc/draftsight-troubleshoot.md)
- document
  - [translator](https://github.com/crow-translate/crow-translate)
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
  
## media

- editing
  - pdf edit inking `apt install xournal`
  - [pdf join into single page](doc/pdf-join-into-single-page.md)
  - convert jpg to pdf `convert *.jpg -auto-orient out.pdf`
- sound
  - console player `apt install mocp`
- tv
  - kaffeine `apt install kaffine w-scan`
- graphics
  - [test 3d working](doc/test-3d-working.md)
  - [qrcode](doc/qrcode.md)  
  - [screen cast gif](doc/screen-cast.md)
  - freecad
    - [troubleshoot svg import](doc/freecad-import-svg-segmentation-fault.md)
    - [tips](doc/freecad-tips.md)
  - image info `identify image.jpg`
  - crop image `convert input.jpg -crop wxh+x+y out.jpg`
  - [resize image](doc/resize-image.md)  
  - [video transcoding](doc/video-transcoding.md)
  - [remove image exif](doc/remove-image-exif.md)
  - [grab screen to image](doc/grab-screen-to-image.md)
  - ubuntu cast to chromecst `apt install mkchromecast`
  - show opengl limits `glxinfo -l`  
  - compare two images `compare -metric AE image1.png image2.png diffout.png`
  - [create favicon](./doc/favicon.md)
- misc
  - [stream dvbt to chromecast](doc/stream-dvbt-to-chromecast.md)
