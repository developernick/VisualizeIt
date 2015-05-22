var tpl = _.template ('<h1> My name is <%= name %> and my favorite movie is <%= movie %>! My favorite city is <%= city %>, and I love WDI because <%= reason %>');

var data = {
  name: "Nick Selesky",
  movie: "Too many to pick one",
  city: "San Diego",
  reason: " of all the funny people that are in or teach class"
};

$('body').html(tpl(data));
