# Configuring XTerm font

XTerm can be widely configured with with use of `~/.Xresources`

Font particularly can be set with line `xterm*font [options]`. For example mine looks like:

`xterm*font: -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso10646-1`

It configures different aspects of displayed font but it's hard to generate(and understand) manually.

## Pick and configure with xfontsel

Luckily there is a utility which really helps: `xfontsel`. Start xfontsel, pick how your font should look like and copy and paste it into `~/.Xresources`. The options string is automatically copied into your clipboard when you click on 'select' button.

## Tinker it with appress

However the end result in XTerm can be bit different than in xfontsel. It can be caused by some other settings from background to diacritics. Now it's best to tinker the font look in XTerm itself. If you press ctrl and click with right mouse button anywhere in XTerm you get font setting menu. When you are done with configuring use program called `appres`. With `$appres XTerm` it prints out all display settings of given X application. Grep 'font' and look for 'xterm*font' line. Copy and paste it into your ~/.Xresources file and from now on you have nice XTerm font.

Both xfontsel and appres should be commonly present in your package managers.

**Note**:
The change will appear after reboot or if you call `$xrdb -load ~/.Xresources`
