window.onload = () ->
  # Grab the elements
  sourceElem   = document.getElementById('source')
  compiledElem = document.getElementById('compiled')
  runBtnElem   = document.getElementById('btn-run')

  editor = CodeMirror.fromTextArea sourceElem,
    'matchBrackets': true
    'lineNumbers': false
    'indentUnit': 2
    'tabMode': "shift"
    'enterMode': "flat"
    'mode': "coffeescript"
    'theme': "om"

  compiled = CodeMirror.fromTextArea compiledElem,
    'readOnly': true
    'matchBrackets': true
    'lineNumbers': false
    'indentUnit': 2
    'tabMode': "shift"
    'enterMode': "flat"
    'mode': "javascript"
    'theme': "om-dark"

  # Compile the source
  compile = () ->
    CoffeeScript.compile editor.getValue(), {'bare': true}

  # Run the code
  exec = () ->
    try
      data = 
        'command': 'CoffeeScriptExec'
        'code':    compile()

      chrome.extension.sendRequest data, (json) ->
        # TODO: Do something once we have the response.
        null

    catch err
      # Do nothing
      null

  editorTextfeild   = editor.getInputField()
  compiledTextfeild = compiled.getInputField()

  # Watch for 'inject' key press.
  editorTextfeild.onkeypress = (e) ->
    # Watch for ctrl + i (inject)
    if e.ctrlKey && e.keyCode == 9
      exec()


  # Compile on keydown
  editorTextfeild.onkeyup = (e) ->
    # Compile source 
    try
      compiled.setValue compile()
    catch err
      compiled.setValue "ERROR: #{err}"


  # Bind proc to exec the code
  runBtnElem.onclick = () ->
    exec()


  compiled.setValue compile()
 
