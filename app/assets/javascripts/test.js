$(function() {
    var card = $(".main__image");
    card.on("click",function(){
        var img = $(this).find("img");
        img.css("opacity","0.5");
    })
})

