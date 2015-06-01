
// $(document).ready(function(event) {});

// $(document).on("click","#signup",function(){
// 	$(#signUpForm).show();
// });

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
var samples = 2048;
var analyser = context.createAnalyser();
// ---Getting Users Microphone---
navigator.getUserMedia({audio: true}, function(stream) {
	microphone = context.createMediaStreamSource(stream);
	microphone.connect(analyser);
	// analyser.connect(context.destination); <---- allows monitoring
	analyser.fftSize = samples;

	var data = new Uint8Array(samples);

	setInterval(function(){
    analyser.getByteFrequencyData(data);
    d3Project(data);
  }, 5); // repeat rendering project

}, function(error){console.log(error);});

// 													-_-_-_-_-_- ***D3*** -_-_-_-_-_-



function d3Project(data){

	var colorGradient = d3.scale.linear()
	    .domain([0.5, 0.75, 2])
	    .range(['#ff0000', '#0000ff', '#00ff00']);

  svg.selectAll('circle')
      .data(data)
      .enter()
        .append('circle');

  svg.selectAll('circle')
    .data(data)
        .attr('r', function(d){ return d/35 +'px';})
        .attr('cx', function(y, x){ return (103-(data.length/(x+1)))+'%';})
        .attr('cy', function(d){ return Math.abs(430-d*1.75) +'px';})
        .attr('class','bubble')
        .style('fill',function(d){ return colorGradient(100/d);})
        .style('opacity', function(d){ return d/120;});
				// .style('transition', function(d){return })
    return svg;
}

window.onload = function(){

  svg = d3.select('#window')
          .append('svg')
						.attr('class', 'tweleve columns')
            // .attr('width', '980px')
            .attr('height', '410px');
};
