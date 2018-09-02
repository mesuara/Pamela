// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require_tree .
//= require jquery

$(document).ready(function() {
    
    $.ajax({
        method: 'GET',
        url: '/pages/news',
        success: function(response) {
           for(let i =0; i<response.articles.length; i++) {
            let owner = response.articles[i].author;
            let title = response.articles[i].title;
            let description = response.articles[i].description;
            let more = response.articles[i].url;
            let image = response.articles[i].urlToImage;
            console.log(title)
            let maincontainer = $('<div>')
            $(maincontainer).addClass('main')
              let tit = $('<h1>')
              $(tit).text(title)
              let img = $('<img></img>')
              $(img).attr("src", image);
              $(img).addClass("articleimg")
              let para = $('<p>')
              $(para).text(description )
              let author = $('<h5>')
              $(author).text("author: " + "'" + owner + "'")
              $(author).addClass("author")
              let readmore = $('<a>')
              $(readmore).text("readmore...")
              $(readmore).attr("href", more)

            $(maincontainer).append(tit, img, para, readmore, author)
            $('#article').append(maincontainer)
           }

            
            console.log("I am in articles js")
          
            

          
        }
    

});

});

