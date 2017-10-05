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

  var tagged_articles_container = document.getElementById('articles');
  var articles_state = tagged_articles_container.innerHTML;

  window.history.replaceState(articles_state, null, null);
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

window.addEventListener('popstate', function(e) {
  var tagged_articles_container = document.getElementById('articles');
  tagged_articles_container.innerHTML = e.state;
});

// function limitByTag(tag) {
//   articles = document.getElementById('articles').children;
//
//   for (var i = 0; i < articles.length; i++) {
//     var article = articles[i];
//     tags = article.children[2].innerHTML;
//     if (tags.search(tag) == -1) {
//       document.getElementById(article.id).style.display = 'none';
//     }
//   }
// }
