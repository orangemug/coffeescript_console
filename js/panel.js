(function() {
  window.onload = function() {
    var compile, compiled, compiledElem, compiledTextfeild, editor, editorTextfeild, exec, runBtnElem, sourceElem;
    sourceElem = document.getElementById('source');
    compiledElem = document.getElementById('compiled');
    runBtnElem = document.getElementById('btn-run');
    editor = CodeMirror.fromTextArea(sourceElem, {
      'matchBrackets': true,
      'lineNumbers': false,
      'indentUnit': 2,
      'tabMode': "shift",
      'enterMode': "flat",
      'mode': "coffeescript",
      'theme': "om"
    });
    compiled = CodeMirror.fromTextArea(compiledElem, {
      'readOnly': true,
      'matchBrackets': true,
      'lineNumbers': false,
      'indentUnit': 2,
      'tabMode': "shift",
      'enterMode': "flat",
      'mode': "javascript",
      'theme': "om-dark"
    });
    compile = function() {
      return CoffeeScript.compile(editor.getValue(), {
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
    editorTextfeild = editor.getInputField();
    compiledTextfeild = compiled.getInputField();
    editorTextfeild.onkeypress = function(e) {
      if (e.ctrlKey && e.keyCode === 9) {
        return exec();
      }
    };
    editorTextfeild.onkeyup = function(e) {
      try {
        return compiled.setValue(compile());
      } catch (err) {
        return compiled.setValue("ERROR: " + err);
      }
    };
    runBtnElem.onclick = function() {
      return exec();
    };
    return compiled.setValue(compile());
  };
}).call(this);
