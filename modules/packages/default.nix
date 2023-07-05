{ inputs, pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.packages;
in {
    options.modules.packages = { enable = mkEnableOption "packages"; };
    config = mkIf cfg.enable {
        home.packages = with pkgs; [
          # Basic Tools
          exa
          fzf
          ripgrep
          ffmpeg
          gnupg
          imagemagick
          libnotify
          git
					file
          bat
          wget
          neovim
          gcc
          cmake
          unzip
          pavucontrol
          playerctl
          swaylock-fancy
          swaylock-effects
          brightnessctl
          inputs.hypr-contrib.packages.${pkgs.system}.grimblast
          openssl
          cifs-utils
          mlocate
          nfs-utils
          openvpn
          p7zip
          samba
          net-snmp
          tcpdump
          inetutils 
          unrar
          distrobox
          dig
          # Proggrmming
          python3
          python311Packages.pip
          lua
          nodejs
          php
          jdk
          # GUI Applications
          kitty
          librewolf
          firefox-wayland
          wdisplays
          wireshark
          cherrytree
          burpsuite
          cinnamon.nemo-with-extensions
          cinnamon.nemo-emblems
          cinnamon.nemo-fileroller
          cinnamon.folder-color-switcher
          remmina
          # Offensive Tools and Applications
          nmap
          crackmapexec
          gobuster
          theharvester
          ffuf
          wfuzz
          metasploit
          exploitdb
          sqlmap
          smbmap
          arp-scan
          enum4linux
          enum4linux-ng
          dnsrecon
          testssl
          hashcat
          john
          thc-hydra
          whatweb
          evil-winrm
          crunch
          hashcat-utils
          proxychains
          cadaver
          wpscan
          adreaper
          certipy
          coercer
          gomapenum
          kerbrute
          nbtscanner
          python311Packages.lsassy
          python311Packages.pypykatz
          smbscan
          davtest
          adenum
          ldapdomaindump
          python311Packages.pypykatz
        ];
      };
  }
