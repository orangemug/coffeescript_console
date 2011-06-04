# Add a listener so we can execute javascript in the open tab.
chrome.extension.onRequest.addListener (request, sender, response) ->
  return if request.command != 'CoffeeScriptExec'

  # Execute the javascript
  chrome.tabs.executeScript null, {'code': request.code}, (resp) ->
    # Should be passing the response back here.
    # response('TODO')
    null

  null
