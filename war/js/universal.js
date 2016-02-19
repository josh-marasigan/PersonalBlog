// To Query
// Center a div to fit the middle of the screen regardless of size
jQuery.fn.center = function () {
    this.css("position","relative");
    this.css("padding-top", ($(window).height() / 3) + "px");
    this.css("padding-bottom", ($(window).height() / 3) + "px");
    this.css("padding-left", $(window).width() / 8 + "px");
    this.css("padding-right", $(window).width() / 8 + "px");
    return this;
}

alignR = function() {

	this.css("position","relative");
    this.css("padding-top", ($(window).height() / 4) + "px");
    this.css("padding-left", $(window).width() / 9 + "px");
    return this;
}

imgRes = function() {
	this.css("width", ($(window).width()) + "px");
}

// Set Dimentions to window sizes
// Scrolling
$(document).ready(function (){

    $("#b1").click(function (){
        $('html, body').animate({
        	scrollTop: $("#twoIn").offset().top
       }, 800);
    });
    $("#b2").click(function (){
        $('html, body').animate({
            scrollTop: $("#threeIn").offset().top
       }, 800);
    });
    $("#b3").click(function (){
        $('html, body').animate({
            scrollTop: $("#fourDiv").offset().top
       }, 800);
    });
    $("#b4").click(function (){
        $('html, body').animate({
            scrollTop: $("#fiveIn").offset().top
       }, 800);
    });
    // Scroll Back
    $("#back").click(function (){
        $('html, body').animate({
        	scrollTop: $("#topDiv").offset().top
       }, 800);
    });
    $("#back2").click(function (){
        $('html, body').animate({
        	scrollTop: $("#topDiv").offset().top
       }, 800);
    });
    $("#back3").click(function (){
        $('html, body').animate({
        	scrollTop: $("#topDiv").offset().top
       }, 800);
    });
    // Center Divs and Elements through jQuery
    
    $("#filler").center();

});