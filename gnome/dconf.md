```sh
Ultra9-285K% dconf dump /org/gnome/
```

```
[control-center]
last-panel='background'
...

[desktop/app-folders]
folder-children=['Utilities', 'YaST', 'Pardus']

[desktop/app-folders/folders/Pardus]
categories=['X-Pardus-Apps']
name='X-Pardus-Apps.directory'
translate=true

[desktop/app-folders/folders/Utilities]
apps=['gnome-abrt.desktop', 'gnome-system-log.desktop', ...]
name='X-GNOME-Utilities.directory'
translate=true

[desktop/app-folders/folders/YaST]
categories=['X-SuSE-YaST']
name='suse-yast.directory'
translate=true

[desktop/background]
color-shading-type='solid'
picture-options='zoom'
picture-uri='file:///usr/share/backgrounds/Fuwafuwa_nanbatto_san_by_amaral-light.png'
picture-uri-dark='file:///usr/share/backgrounds/Fuwafuwa_nanbatto_san_by_amaral-dark.png'
primary-color='#000000'
secondary-color='#000000'

[desktop/input-sources]
mru-sources=[('xkb', 'us'), ('ibus', 'libpinyin')]
sources=[('xkb', 'us'), ('ibus', 'libpinyin')]
xkb-options=@as []

[desktop/interface]
color-scheme='default'
gtk-theme='Yaru'
icon-theme='Yaru'

[desktop/notifications]
application-children=['org-gnome-nautilus', 'org-gnome-terminal', 'org-gnome-settings', 'apport-gtk']

[desktop/notifications/application/apport-gtk]
application-id='apport-gtk.desktop'

[desktop/notifications/application/org-gnome-nautilus]
application-id='org.gnome.Nautilus.desktop'

[desktop/notifications/application/org-gnome-settings]
application-id='org.gnome.Settings.desktop'

[desktop/notifications/application/org-gnome-terminal]
application-id='org.gnome.Terminal.desktop'

[desktop/peripherals/keyboard]
numlock-state=false

[desktop/peripherals/mouse]
left-handed=true

[desktop/peripherals/touchpad]
two-finger-scrolling-enabled=true

[desktop/screensaver]
color-shading-type='solid'
picture-options='zoom'
picture-uri='file:///usr/share/backgrounds/Fuwafuwa_nanbatto_san_by_amaral-light.png'
primary-color='#000000'
secondary-color='#000000'

[desktop/search-providers]
sort-order=['org.gnome.Contacts.desktop', 'org.gnome.Documents.desktop', 'org.gnome.Nautilus.desktop']

[evince/default]
continuous=true
dual-page=true
dual-page-odd-left=false
enable-spellchecking=true
fullscreen=false
inverted-colors=false
show-sidebar=true
sidebar-page='links'
sidebar-size=401
sizing-mode='automatic'
window-ratio=(3.1380190834565242, 1.2448182066540761)

[evolution-data-server]
migrated=true

[gnome-system-monitor]
cpu-colors=[(uint32 0, '#e01b24'), (1, '#ff7800'), (2, '#f6d32d'), (3, '#33d17a'), (4, '#26a269'), (5, '#62a0ea'), (6, '#1c71d8'), (7, '#613583'), (8, '#9141ac'), (9, '#c061cb'), (10, '#ffbe6f'), (11, '#f9f06b'), (12, '#8ff0a4'), (13, '#2ec27e'), (14, '#1a5fb4'), (15, '#c061cb'), (16, '#799984dff332'), (17, '#a85bf3327999'), (18, '#f3327999cbd6'), (19, '#7999ef51f332'), (20, '#f332d3977999'), (21, '#b01b7999f332'), (22, '#7999f3328ca0'), (23, '#f33279998a0d')]
current-tab='resources'
show-dependencies=false
show-whose-processes='user'
window-height=846
window-width=1070

[gnome-system-monitor/disktreenew]
col-6-visible=true
col-6-width=0
columns-order=[5]
sort-col=1
sort-order=0

[mutter]
edge-tiling=false
experimental-features=@as []

[nautilus/preferences]
default-folder-viewer='icon-view'
migrated-gtk-settings=true
search-filter-time-type='last_modified'

[nautilus/window-state]
initial-size=(1146, 648)

[portal/filechooser/com.google.Chrome]
last-folder-path='/home/wallace/Downloads'

[settings-daemon/plugins/color]
night-light-enabled=false

[settings-daemon/plugins/power]
sleep-inactive-ac-timeout=3600
sleep-inactive-ac-type='nothing'

[shell]
disabled-extensions=['tiling-assistant@ubuntu.com']
enabled-extensions=['ding@rastersoft.com', 'ubuntu-dock@ubuntu.com']
favorite-apps=['org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'code.desktop', 'google-chrome.desktop']
welcome-dialog-last-shown-version='46.0'

[shell/extensions/dash-to-dock]
dash-max-icon-size=48
dock-fixed=true
dock-position='BOTTOM'
extend-height=false

[shell/extensions/ding]
icon-size='standard'
show-home=false
start-corner='bottom-right'

[shell/extensions/tiling-assistant]
active-window-hint-color='rgb(211,70,21)'
last-version-installed=46

[shell/world-clocks]
locations=@av []

[terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9]
background-color='rgb(0,0,0)'
background-transparency-percent=20
default-size-columns=128
font='Monospace 18'
foreground-color='rgb(255,255,255)'
scrollbar-policy='always'
use-system-font=false
use-theme-colors=false
use-theme-transparency=false
use-transparent-background=true
```

---

```sh
Ultra9-285K% dconf dump /org/gnome/terminal/
```

```
[legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9]
background-color='rgb(0,0,0)'
background-transparency-percent=20
default-size-columns=128
font='Monospace 18'
foreground-color='rgb(255,255,255)'
scrollbar-policy='always'
use-system-font=false
use-theme-colors=false
use-theme-transparency=false
use-transparent-background=true
```

---

```sh
Ultra9-285K% dconf dump /org/gnome/terminal/legacy/
```

```
[profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9]
background-color='rgb(0,0,0)'
background-transparency-percent=20
default-size-columns=128
font='Monospace 18'
foreground-color='rgb(255,255,255)'
scrollbar-policy='always'
use-system-font=false
use-theme-colors=false
use-theme-transparency=false
use-transparent-background=true
```

---

```sh
Ultra9-285K% dconf dump /org/gnome/terminal/legacy/profiles:/
```

```
[:b1dcc9dd-5262-4d8d-a863-c897e6d979b9]
background-color='rgb(0,0,0)'
background-transparency-percent=20
default-size-columns=128
font='Monospace 18'
foreground-color='rgb(255,255,255)'
scrollbar-policy='always'
use-system-font=false
use-theme-colors=false
use-theme-transparency=false
use-transparent-background=true
```

---

```sh
Ultra9-285K% dconf dump /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/
```

```
[/]
background-color='rgb(0,0,0)'
background-transparency-percent=20
default-size-columns=128
font='Monospace 18'
foreground-color='rgb(255,255,255)'
scrollbar-policy='always'
use-system-font=false
use-theme-colors=false
use-theme-transparency=false
use-transparent-background=true
```