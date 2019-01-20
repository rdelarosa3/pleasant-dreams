// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){
  var defaults = {
    'username': '',
    'container': '',
    // 'display_profile': true,
    // 'display_biography': true,
    'display_gallery': true,
    'get_raw_json': false,
    'callback': null,
    'styling': true,
    'items': 8,
    'items_per_row': 4,
    'margin': 0.5
  };
  $.instagramFeed = function(options){
    options = $.fn.extend({}, defaults, options);
    
    if(options.username == "" && options.tag == ""){
      console.log("Instagram Feed: Error, no username or tag found.");
      return;
    } 

    var url = "https://www.instagram.com/explore/tags/"+ options.username;
    $.get(url, function(data){
      data = data.split("window._sharedData = ");
      data = data[1].split("<\/script>");
      data = data[0];
      data = data.substr(0, data.length - 1);
      data = JSON.parse(data);
      data = data.entry_data.TagPage[0].graphql.hashtag;
      
      if(options.get_raw_json){
        options.callback(JSON.stringify({
          'images': data.edge_hashtag_to_media.edges,
        }));
        return;
      }
      
      var styles = {
        'gallery_image': ""
      };

      if(options.styling){
        var width = (100 - options.margin * 2 * options.items_per_row)/options.items_per_row;
        styles.gallery_image = " style='margin:"+options.margin+"% "+options.margin+"%;width:"+width+"%;'";
        
      }

      // var html = "";      
      // if(options.display_gallery){
      //   if(data.is_private){
      //     html += "<p class='instagram_private'><strong>This profile is private</strong></p>";
      //   }else{
      //     var imgs = data.edge_hashtag_to_media.edges;
      //       max = (imgs.length > options.items) ? options.items : imgs.length;
          
      //     html += "<div class='instagram_gallery grid-item'>";
      //     for(var i = 0; i < max; i++){
      //       var url = "https://www.instagram.com/p/"+ imgs[i].node.shortcode;
      //       html += "<a href='"+url+"' target='_blank'>";
      //       html += " <img src='"+ imgs[i].node.thumbnail_src +"' alt='"+ options.username +" instagram image "+ i+"'"+styles.gallery_image+" class='instagram-thumbs' />";
      //       html += "</a>";
      //     }
      //     html += "</div>";
      //   }
      // }

      // test section
      var html = "";      
      if(options.display_gallery){
        if(data.is_private){
          html += "<p class='instagram_private'><strong>This profile is private</strong></p>";
        }
        else{
          var imgs = data.edge_hashtag_to_media.edges;
            // console.log(imgs.length);
            // while(imgs.length%9 != 0){imgs.shift();}
            // console.log(imgs.length);
          
            max = (imgs.length > options.items) ? options.items : imgs.length;
          
          html += '<div class="row no-gutters">';
          count = 1
          for(var i = 0; i < max; i++){
            var url = "https://www.instagram.com/p/"+ imgs[i].node.shortcode;
            html += "<div class='col-xs-3 col-sm-3 col-md-2 col-lg-2 item zoom-on-hover' id='gal"+count+"'>";
            html += "<a data-lightbox='inks' href='"+ imgs[i].node.thumbnail_src +"'> <img src='"+ imgs[i].node.thumbnail_src +"' alt='"+ options.username +" instagram image "+ i+"'"+styles.gallery_image+" class='img-fluid image ink-image'/></a></div>";
            count += 1;
          }
          html += "</div>";
        }
      }


      $(options.container).html(html);
    });
  };
  
});


















