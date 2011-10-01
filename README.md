# CoffeeScript Console

It's a clone of the 'Try CoffeeScript' functionality from the [CoffeeScript website](http://jashkenas.github.com/coffee-script), for the Google Chrome browser developer tools.

![screenshot](https://github.com/orangemug/coffeescript_console/raw/master/assets/screenshot.png)

## Usage
It's a bit lame on the features at the moment, but here they are...

 * Typing CoffeeScript in the editor panel (left) compiles to JavaScript directly in the right panel
 * Press `ctrl + i` to inject from the editor pane into the active tab
 * Syntax highlighting (via [CodeMirror](http://codemirror.net))


## To build
To build just run the following from the base directory, which will create you the `.crx` extension to install into chrome

    ./build.sh


## Install

Either install the `.crx` from the build described above by simply dragging it into chrome, or just install it as an unpacked extension. The details to do that are [here](http://code.google.com/chrome/extensions/getstarted.html)


## Future features

 * Show responses to commands injected simular to Chromes console panel.
 * History support
 * Can we pass forward all the `$0`, `copy()` etc... commands???
 * Implement js2coffee for reverse compile


## Contributing

The project uses the branching model outlined [here](http://nvie.com/posts/a-successful-git-branching-model/), so basically do any commits on the _develop_ branch. There's also a tool called [gitflow](https://github.com/nvie/gitflow) which helps with this branching model. Also note you'll have to run the following to compile the coffeescript during development

    coffee --watch -c js


## External Libs
Coffeescript Console uses these awesome open source libs:

 * <http://codemirror.net> - For the editor panes and syntax highlighting
 * <http://jashkenas.github.com/coffee-script/> - Unsurprisingly
