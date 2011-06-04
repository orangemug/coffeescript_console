(function() {
  window.onload = function() {
    var compile, compiledElem, exec, runBtnElem, sourceElem;
    sourceElem = document.getElementById('source');
    compiledElem = document.getElementById('compiled');
    runBtnElem = document.getElementById('btn-run');
    compile = function() {
      return CoffeeScript.compile(sourceElem.value, {
        'bare': true
      });
    };
    exec = function() {
      var data;
      try {
        data = {
          'command': 'CoffeeScriptExec',
          'code': compile()
        };
        return chrome.extension.sendRequest(data, function(json) {
          return null;
        });
      } catch (err) {
        return null;
      }
    };
    sourceElem.onkeypress = function(e) {
      if (e.ctrlKey && e.keyCode === 9) {
        return exec();
      }
    };
    sourceElem.onkeyup = function(e) {
      var end, node, start, str, text;
      if (e.keyCode === 9) {
        e.preventDefault();
        node = e.currentTarget;
        text = "  ";
        start = node.selectionStart;
        end = node.selectionEnd;
        str = "";
        str += node.value.substring(0, start);
        str += text;
        str += node.value.substring(end, node.value.length);
        node.value = str;
        node.setSelectionRange(end + text.length, end + text.length);
      }
      try {
        compiledElem.classList.remove('error-msg');
        return compiledElem.innerHTML = compile();
      } catch (err) {
        compiledElem.innerHTML = "ERROR: " + err;
        return compiledElem.classList.add('error-msg');
      }
    };
    return runBtnElem.onclick = function() {
      alert("Clicked");
      return exec();
    };
  };
}).call(this);
