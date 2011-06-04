(function() {
  chrome.extension.onRequest.addListener(function(request, sender, response) {
    if (request.command !== 'CoffeeScriptExec') {
      return;
    }
    chrome.tabs.executeScript(null, {
      'code': request.code
    }, function(resp) {
      return null;
    });
    return null;
  });
}).call(this);
