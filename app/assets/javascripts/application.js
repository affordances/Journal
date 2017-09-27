// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function checkForEntry(textarea, button) {
  if (textarea.value.length > 0) {
    document.getElementById(button).disabled = false;
  }
}

function formatTags(tags) {
  var tagList = tags.split(/\s+|\,/);
  var newTags = '';
  for (var i = 0; i < tagList.length; i++) {
    if (tagList[i] !== "") {
      newTags += '#' + tagList[i].replace('#', '') + '  ';
    }
  }
  return newTags;
}

var lastChar = " ";

window.onload = function() {
  var tags = document.getElementById('new_article_tags');
  allowTagEditing(tags);
}

function allowTagEditing(tags) {
  tags.addEventListener('keydown', function(e){
    var code = e.keyCode;
    if (code == 37 || code == 39) {
      e.preventDefault();
    }
    if (code == 13 || code == 188 || code == 9 || code == 32) {
      tags.value = formatTags(tags.value);
      e.preventDefault();
    } else if (code == 8) {
      if (tags.value.slice(-1) == ' ' && lastChar === " ") {
        tags.value = tags.value.substr(0, tags.value.lastIndexOf('#'));
        e.preventDefault();
      }
      lastChar = tags.value.slice(-1);
    }
  });
}
