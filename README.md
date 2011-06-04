# CoffeeScript Console

Basically the 'Try CoffeeScript' from the [CoffeeScript website](http://jashkenas.github.com/coffee-script) but for the Google Chrome browser developer tools.

![screenshot](https://github.com/orangemug/coffeescript_console/raw/master/assets/screenshot.png)

## Usage
It's a bit lame on the features at the moment but here they are...

 * Typing CoffeeScript in the editor panel (left) compiles JavaScript directly in the right panel
 * Press `ctrl + i` to inject from the editor pane into the active tab
 * Pressing the `tab` key doesn't switch focus (that's sooo annoying when you want an actual tab character)


# Install

Until I get into a bundled install, just install it as an unpacked extenstion. The details to do that are [here](http://code.google.com/chrome/extensions/getstarted.html)


# To build

To build just run the following from the base directory

    coffee -c js


## Future features

 * Show responses to commands simular to Chromes console panel.
 * History support
 * Can we pass forward all the `$0`, `copy()` etc... commands???
 * Syntax highlighting


## Known issues

 * Can't debug chrome special pages
   - For example 'Cannot access contents of url "chrome://newtab/".'

