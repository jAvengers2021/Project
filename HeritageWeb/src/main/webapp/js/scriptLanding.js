
/*var words = ['Hello!', 'Benvenuto', '你好! ', 'こんにちは!' ];
var counter = 0;
var word = document.getElementById("carousel-words");
setInterval(update_carousel_words, 1500);
function update_carousel_words(){
  word.innerHTML = words[counter];
  counter++;
  if(counter >= words.length){
    counter = 0;
  }
}*/

$(document).ready(function() {
	setTimeout(function() {
		$("#main").removeClass("is-loading");
	}, 100)
});


