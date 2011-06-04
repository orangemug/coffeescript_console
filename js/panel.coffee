window.onload = () ->
  # Grab the elements
  sourceElem   = document.getElementById('source')
  compiledElem = document.getElementById('compiled')
  runBtnElem   = document.getElementById('btn-run')

  # Compile the source
  compile = () ->
    CoffeeScript.compile sourceElem.value, {'bare': true}

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

  # Watch for 'inject' key press.
  sourceElem.onkeypress = (e) ->
    # Watch for ctrl + i (inject)
    if e.ctrlKey && e.keyCode == 9
      exec()


  # Compile on keydown
  sourceElem.onkeyup = (e) ->
    # Also capture a tab and insert 2 spaces.
    if e.keyCode == 9
      e.preventDefault()
      node = e.currentTarget

      # Insert a tab instead.
      text = "  "
      start = node.selectionStart
      end   = node.selectionEnd

      str  = ""
      str += node.value.substring(0, start)
      str += text
      str += node.value.substring(end, node.value.length)
      node.value = str
      node.setSelectionRange end+text.length, end+text.length

    # Compile source 
    try
      compiledElem.classList.remove('error-msg')
      compiledElem.innerHTML = compile()
    catch err
      compiledElem.innerHTML = "ERROR: #{err}"
      compiledElem.classList.add('error-msg')


  # Bind proc to exec the code
  runBtnElem.onclick = () ->
    alert "Clicked"
    exec()
 
