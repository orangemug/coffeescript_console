# CoffeeScript Console

It's a clone of the 'Try CoffeeScript' functionality from the [CoffeeScript website](http://jashkenas.github.com/coffee-script), for the Google Chrome browser developer tools.

![screenshot](https://github.com/orangemug/coffeescript_console/raw/master/assets/screenshot.png)

## Usage
It's a bit lame on the features at the moment, but here they are...

 * Typing CoffeeScript in the editor panel (left) compiles to JavaScript directly in the right panel
 * Press `ctrl + i` to inject from the editor pane into the active tab
 * Pressing the `tab` key doesn't switch focus


# Install

Until I get it into a bundled install just install it as an unpacked extension. The details to do that are [here](http://code.google.com/chrome/extensions/getstarted.html)


# To build

To build just run the following from the base directory

    coffee -c js


## Future features

 * Show responses to commands injected simular to Chromes console panel.
 * History support
 * Can we pass forward all the `$0`, `copy()` etc... commands???
 * Syntax highlighting


## Known issues

 * You can't debug Chrome special pages
   - Error 'Cannot access contents of url "chrome://newtab/".'

