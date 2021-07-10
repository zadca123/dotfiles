# append
path+=("$HOME/.local/bin")
path+=("$HOME/.emacs.d/bin")
path+=("/etc/profile")
path+=("/usr/sbin")
## or prepend
#path=('/home/zadca123/.local/bin' $path)
export PATH

# # Default programs:
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="palemoon"
export READER="zathura"
export OPEN="xdg-open"
export IMAGE="sxiv"
export VIDEO="mpv"
export PAGER="less"
export FILE_MANAGER="rox"

export nnn_sel=${NNN_SEL:-${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection}
export NNN_TRASH=1
export NNN_PLUG='i:imgthumb;m:mocplay;t:preview-tui;T:preview-tabbed;n:nuke;d:dragdrop;l:launch'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_OPENER='xdg-open'
export NNN_BMS="d:~/Documents;D:~/Downloads;h:$HOME;t:~/Torrents;m:~/mnt/elements/multimedia;c:$XDG_CONFIG_HOME;s:$SCRIPTS;M:/mnt/;S:$HOME/Studia/semestr_4/;f:~/Movies;v:~/Videos;g:~/Games;h:~/;p:~/Pictures"

export SCREENSHOTS="$HOME/Documents/screenshots"
export SCRIPTS="$HOME/.local/bin"
export WALLPAPERS="$HOME/Pictures/wallpapers"
export TORRENTS="/mnt/toshiba/torrents"
export STUDY="/mnt/seagate/desktop/Studia/semestr_4"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export BACKUP="/mnt/crucial_nvme/Backup"

# Other program settings:
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
# export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
# export QT_QPA_PLATFORMTHEME="qt5ct"
# export QT_QPA_PLATFORMTHEME="qt5ct-style"
# export QT_STYLE_OVERRIDE="NULL"
#export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
#export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.
#export AWT_TOOLKIT="MToolkit wmname LG3D"	#May have to install wmname
#export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm

export LF_ICONS="\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.vimrc=:\
*.viminfo=:\
*.gitignore=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=📦:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=📦:\
*.zip=📦:\
*.z=:\
*.dz=:\
*.gz=📦:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=📦:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=🎬:\
*.webm=🎬:\
*.ogm=:\
*.mp4=🎬:\
*.m4v=🎬:\
*.mp4v=🎬:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=🎬:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=🎶:\
*.au=:\
*.flac=🎶:\
*.m4a=🎶:\
*.mid=:\
*.midi=🎶:\
*.mka=:\
*.mp3=🎶:\
*.mpc=:\
*.ogg=🎶:\
*.ra=:\
*.wav=🎶:\
*.oga=🎶:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"

# # autologin on tty1
# if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
# 	exec startx
# fi

