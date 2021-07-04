from typing import List  # noqa: F401

import os
import re
import socket
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, KeyChord
from libqtile.lazy import lazy
from libqtile.command import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
# myTerm = "kitty"
myTerm = "alacritty"
# myTerm = guess_terminal()

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "control"], "Return", lazy.layout.toggle_split(),desc="Toggle between split and unsplit sides of stack"),

    ### Essencial ###
    Key([mod], "n",     lazy.layout.normalize()),
    Key([mod], "space", lazy.next_layout()),
    Key([mod], "Tab",   lazy.layout.next()),
    Key([mod, "shift"], "Tab",   lazy.layout.previous()),
    Key([mod], "q",     lazy.window.kill()),
    Key([mod], "r",     lazy.spawncmd()),
    Key([mod], "f",     lazy.window.toggle_fullscreen()),
    Key([mod, "shift"], "Return", lazy.spawn(myTerm)),

    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),

    ### MINE ###
    Key([mod],  "p",    lazy.spawn("rofi -show drun -show-icons")),
    Key([mod],  "l",    lazy.spawn("rofi -modi 'emoji:rofimoji -a clipboard' -show emoji")),
    Key([mod],  "F2",   lazy.spawn("pamixer --decrease 2")),
    Key([mod],  "F3",   lazy.spawn("pamixer --increase 2")),
    Key([mod],  "F4",   lazy.spawn("pamixer --toggle-mute")),
    Key(["mod1"], "n",  lazy.spawn(myTerm+" -e dtach -A vifx vifm")),
    Key(["mod1"], "a",  lazy.spawn(myTerm+" -e pulsemixer")),
    # Key(["mod1"], "a",  lazy.spawn(myTerm+" -e ncpamixer")),
    Key(["mod1"], "d",  lazy.spawn(myTerm+" -e stig")),

    Key(["mod1"], "F1", lazy.spawn(myTerm+" -e dtach -A cmux cmus")),
    Key(["mod1"], "F2", lazy.spawn("cmus-remote --volume -2%")),
    Key(["mod1"], "F3", lazy.spawn("cmus-remote --volume +2%")),
    Key(["mod1"], "F4", lazy.spawn("cmus-remote-notify.sh -S")),
    Key(["mod1"], "F5", lazy.spawn("cmus-remote-notify.sh -s")),
    Key(["mod1"], "F6", lazy.spawn("cmus-remote-notify.sh -r")),
    Key(["mod1"], "F7", lazy.spawn("cmus-remote-notify.sh -u")),
    Key(["mod1"], "F8", lazy.spawn("cmus-remote-notify.sh -n")),

    Key(["mod1"], "r",  lazy.spawn("redshift -b 0.95 -O 5000K")),
    Key(["mod1"], "g",  lazy.spawn("steam")),
    Key(["mod1"], "w",  lazy.spawn("palemoon")),
    Key(["mod1"], "v",  lazy.spawn("qutebrowser")),
    Key(["mod1"], "e",  lazy.spawn("emacsclient -c -a emacs")),

    Key(["mod1", "shift"], "t", lazy.spawn("teamspeak3")),
    Key(["mod1", "shift"], "r", lazy.spawn("redshift -x")),
    Key(["mod1", "shift"], "n", lazy.spawn("nitrogen --set-zoom-fill --random")),
    

    Key([],     "Print",            lazy.spawn("flameshot gui")),
    Key([mod],  "Print",            lazy.spawn("screenshot.sh full")),
    Key([mod,   "shift"], "Print",  lazy.spawn("screenshot.sh focused")),
    Key(["mod1"],         "c",      lazy.spawn("screenshot.sh clipboard")),
    Key(["mod1","shift"], "c",      lazy.spawn("screenshot.sh select")),
    Key(["mod1","shift"], "Print",  lazy.spawn("screenshot.sh 16x9")),

]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layout_theme = {"border_width": 2,
                "margin": 6,
                "border_focus": "#98971a",
                "border_normal": "#282828"
                }
layouts = [
    layout.Columns(**layout_theme),
    layout.TreeTab(**layout_theme),
    layout.Max(**layout_theme),
    layout.MonadTall(**layout_theme),
    # layout.Tile(shift_windows=True, **layout_theme),
    # layout.Floating(**layout_theme)
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2, **layout_theme),
    # layout.Bsp(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.MonadWide(**layout_theme),
    # layout.RatioTile(**layout_theme),
    # layout.VerticalTile(**layout_theme),
]

colors =[["#282828", "#282828"],#Background
        ["#ebdbb2", "#ebdbb2"],#Foreground
        ["#282828", "#282828"],#Normal colors
        ["#cc241d", "#cc241d"],
        ["#98971a", "#98971a"],
        ["#d79921", "#d79921"],
        ["#458588", "#458588"],
        ["#b16286", "#b16286"],
        ["#689d6a", "#689d6a"],
        ["#a89984", "#a89984"], 
        ["#928374", "#928374"],# Bright colors
        ["#fb4934", "#fb4934"],
        ["#b8bb26", "#b8bb26"],
        ["#fabd2f", "#fabd2f"],
        ["#83a598", "#83a598"],
        ["#d3869b", "#d3869b"],
        ["#8ec07c", "#8ec07c"],
        ["#ebdbb2", "#ebdbb2"]]
prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

widget_defaults = dict(
    font='monofur Nerd Font Mono',
    fontsize=18,
    padding=10,
    background=colors[0],
    foreground=colors[1],
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(linewidth = 2, foreground = colors[3]),
                widget.GroupBox(padding=4, visible_groups=None),
                widget.Sep(linewidth = 2, foreground = colors[3]),
                widget.CurrentLayoutIcon(),
                widget.Sep(linewidth = 2, foreground = colors[3]),
                widget.Prompt(),
                widget.Sep(linewidth = 2, foreground = colors[3]),
                widget.WindowName(),
                widget.Sep(linewidth = 2, foreground = colors[3]),
                widget.Systray(),
                widget.Sep(linewidth = 2, foreground = colors[3]),
                widget.Cmus(fmt='Song:{}'),
                widget.Volume(),
                widget.Sep(linewidth = 2, foreground = colors[3]),
                widget.Volume(),
                widget.Sep(linewidth = 2, foreground = colors[3]),
                widget.CPU(),
                widget.ThermalSensor(),
                widget.Sep(linewidth = 2, foreground = colors[3]),
                widget.Memory(),
                # widget.MemoryGraph(),
                widget.Sep(linewidth = 2, foreground = colors[3]),
                widget.Net(),
                widget.Sep(linewidth = 2, padding = 12, foreground = colors[3]),
                widget.Clock(format='%A, %d %B [%H:%M] %p'),
                widget.Sep(linewidth = 2, padding = 12, foreground = colors[3]),
                widget.QuickExit(default_text="[Off]", countdown_format="[ {} ]"),
                # widget.Backlight(),
                # widget.Battery(),
                # widget.BatteryIcon(),

            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
