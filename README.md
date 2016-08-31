# brightness

small script to work around xbacklight's bug

`xbacklight No outputs have backlight property`

### Usage:

to increace brightness by 5 percent:
`brigtness.sh +5`

to decrease brightness by 5 percent:
`brightness.sh -5`

**Hint:** any integer numbers can be used

### Installation

#### fix permissions
give write permissions to your backlight device by running:

`chmod 666 /sys/class/backlight/intel_backlight/brightness`

**Note:** might be different on your machine

### How to use with i3wm:

#### add the script to your PATH:
`sudo ln -s brightness.sh /usr/local/bin/brightness`

#### include following lines in your ~/.i3/config
```
bindsym XF86MonBrightnessDown exec brightness -10
bindsym XF86MonBrightnessUp exec brightness +10
```
