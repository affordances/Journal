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


function login(form, oldForm) {
  if (oldForm) {
    document.getElementById(oldForm).style.display = 'none';
  }

  var overlay = document.getElementById('overlay');
  var form = document.getElementById(form);

  overlay.style.display = 'block';
  form.style.display = 'block';
  document.getElementsByTagName('body')[0].className += ' scrolling';

  overlay.onclick = function() {
    overlay.style.display = 'none';
    form.style.display = 'none';
    document.getElementsByTagName('body')[0].className = '';
  };
}

function checkForEntry(textarea, button) {
  if (textarea.id == 'new_article_tags') {
    return;
  } else if (textarea.value.length > 0) {
    document.getElementById(button).disabled = false;
  } else {
    document.getElementById(button).disabled = true;
  }
}

function buttonPatch(button) {
  if (button == 'new_article_button') {
    setTimeout(function () {
      document.getElementById(button).disabled = true;
    }, 0);
  }
}

function formatTags(tags) {
  var tagList = tags.split(/\s+/);
  var newTags = '';
  for (var i = 0; i < tagList.length; i++) {
    if (tagList[i] !== '') {
      newTags += ('#' + tagList[i].replace('#', '') + '  ');
    }
  }
  return newTags;
}

window.onload = function() {
  var tags = document.getElementById('new_article_tags');

  if (tags) {
    allowTagEditing(tags);
  }
}

function allowTagEditing(tags) {
  tags.addEventListener('mousedown', function(e){
    tags.focus();
    e.preventDefault();
    setTimeout(function(){
      tags.selectionStart = tags.selectionEnd = tags.value.length;
    }, 0);
  });
  tags.addEventListener('keydown', function(e){
    var code = e.keyCode;
    if (code == 37 || code == 38 || code == 39 || code == 40) {
      e.preventDefault();
    }
    if (code == 13 || code == 188 || code == 9 || code == 32) {
      lastChar = tags.value.slice(-1);
      if (tags.value.slice(-1) == ' ') {
        e.preventDefault();
      } else {
        tags.value = formatTags(tags.value);
        e.preventDefault();
      }
    } else if (code == 8) {
      if (tags.value.slice(-1) == ' ') {
        tags.value = tags.value.substr(0, tags.value.lastIndexOf('#'));
        e.preventDefault();
      }
    }
  });
}

function tagMissing(article_el, tag) {
  var article_els = article_elt.querySelectorAll('.tags a');
  var found_tag = true;
  for (var i = 0; i < a_elts.length; i++) {
    if (article_els[i].innerText === tag) {
      found_tag = false;
    }
  }
  return found_tag;
}

function noArticlesLeft() {
  var articles = document.querySelectorAll('.article')

  if (articles.length === 0) {
    return true;
  }

  return false;
}
