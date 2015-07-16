var interval = setInterval(function () { console.log('...ready')}, 1000);


$(document).ready(function() {
var app = app || {};

// -		-		-		-	Web Audio API
//		-		-		-		-		-	--Global Audio var--
var microphone;
var audioStream;
var array;

// -	-		-		-		-		--Global var for svg--
var svg;
// ---Using the API to get Users microphone---
navigator.getUserMedia = ( navigator.getUserMedia ||
navigator.webkitGetUserMedia ||
navigator.mozGetUserMedia ||
navigator.msGetUserMedia);

window.AudioContext = window.AudioContext ||
window.webkitAudioContext;

var context = new AudioContext();
var samples = 1024;
var analyser = context.createAnalyser();
analyser.smoothingTimeConstant = 0.5;



// ---Getting Users Microphone---
navigator.getUserMedia({audio: true}, function(stream) {
	microphone = context.createMediaStreamSource(stream);
	microphone.connect(analyser);
	// analyser.connect(context.destination); <---- allows monitoring
	analyser.fftSize = samples;
	var data = new Uint8Array(samples);

},	function(error){console.log(error);});

	$('#newVisual').click(function () {
		var data = new Uint8Array(samples);

		if ($('#dropdown').val() == 2) {
			console.log("this is numba one");
			clearInterval(interval);
			interval =	setInterval(function(){
				analyser.getByteFrequencyData(data);
				VisualTwo(data);}, 2);
				app.render();
		} else {
			console.log("hold on to your butts");
			clearInterval(interval);
			interval = setInterval(function(){
				analyser.getByteFrequencyData(data);
				VisualOne(data);}, 2);
				app.render();
		};
	});

// 													-_-_-_-_-_- ***D3*** -_-_-_-_-_-0AD918

// -_-_-_-_-_-_- Bar Visual -_-_-_-_-_-_-

function VisualOne(data){
	var colorGradient = d3.scale.linear()
			.domain([0.2, 0.75, 1.75])
	    .range(['#19EDFF', '#FF6900', '#14CC88']);

  svg.selectAll('rect')
      .data(data)
      .enter()
        .append('rect')

	svg.selectAll('rect')
	.data(data)
			.attr('width', function(d){ return d/10 +'px';})
			.attr('x', function(y, x){ return (120-(data.length/(x-0.005)))+'%';})
			// .attr('y', function(x, y){ return (120-(data.length/(x+0.05)))+'%';})
			.attr('height', function(d){ return Math.abs(250-d*1.5) +'%';})
			.attr('class','bars')
			.style('fill',function(d){ return colorGradient(100/d);})
			.style('opacity', function(d){ return d/800;});
	return svg;
	return false;
};

// -_-_-_-_-_-_- Bubble Visual -_-_-_-_-_-_-

function VisualTwo(data){
	var colorGradient = d3.scale.linear()
	    .domain([0.2, 0.75, 2])
	    .range(['#008888', '#381641', '#31561B']);//([ top, middle, bottom ])

  svg.selectAll('circle')
      .data(data)
      .enter()
        .append('circle')
				// .event($('.bubble').attr('r') > '3px', function(){explode(d3.select(this))})
				.on('mouseover', function(){explode(d3.select(this))});

  svg.selectAll('circle')
    .data(data)
        .attr('r', function(d){ return d/17 +'px';})
        .attr('cx', function(y, x){ return (103-(data.length/(x+0.2)))+'%';})
        .attr('cy', function(d){ return Math.abs(450-d*1.5) +'px';})
        .attr('class','bubble')
        .style('fill',function(d){ return colorGradient(100/d);})
        .style('opacity', function(d){ return d/120;});
    return svg;

		function explode(data){
		data
			.transition(200)
		    .duration(600)
		      .attr('r', function(d){ return d*5;})
					.style('opacity', function(d){ return d/360;});
		  return this;
		};
		return false;
};

// function explode(data){
// 	data
// 	.transition()
//     .duration(500)
//       .attr('r', '100%');
//   return this;
// };

// -_-_-_-_-_-_- Places Visuals on Page -_-_-_-_-_-_-

app.render = function(){
	$('#divsvg').empty('svg');
  svg = d3.select('#divsvg')
          .append('svg')
						.attr('class', ' u-full-width svg')
            .attr('height', '500px');
};

	$(".svg").hide().fadeIn(4000);
	$(".navbar").hide().fadeIn(4000);
	$(".question").hide().fadeIn(10000);
	$(".mainNav").hide().fadeIn(7000);


	$("#login_form").hide();
		$('#signin').click(function() {
        $("#guestbtn").hide();
				$("#login_form").fadeIn(600);
    });

		$("#signup_form").hide();
		$('#signup').click(function() {
        $("#guestbtn").hide();
				$("#signup_form").fadeIn(800);
    });

		window.onload = function () {
			var data = new Uint8Array(samples);
			 function visual() {
				clearInterval(interval);
				interval = setInterval(function(){
					analyser.getByteFrequencyData(data);
					VisualOne(data);}, 2);
					app.render();
				};

				visual();
		};


});
