var createSlug = function(stateName){
  return stateName.toLowerCase().split(" ").join("-");
};

$(function(){

      var width = 960;
      var height = 500;

      var svg = d3.select('#map').append("svg")
        .attr('width', width)
        .attr('height', height);

      var path = d3.geo.path();

      var color = d3.scale.category20b();

      var g = svg.append('g');

      d3.json('/assets/us.json', function(stateData){
            var num = 0;
            var data = topojson.feature(stateData, stateData.objects.states).features;
            debugger;
            neighbors = topojson.neighbors(stateData.objects.states.geometries);
            d3.tsv("/assets/us-state-names.tsv", function(tsv){
                  var names = {};

                  tsv.forEach(function(d,i){
                    var sluggedName = createSlug(d.name);
                    names[d.id] = sluggedName;
                  });

                  g.append("g")
                  .attr("class", "states-bundle")
                  .selectAll("path")
                  .data(data)
                  .enter()
                  .append("path")
                  .attr("id", (function(d){
                    for (var i = 0; i < 53; i++){
                      return names[d.id];
                    }
                  }))
                  .attr("d", path)
                  .style("fill", "gray")
                  .attr("stroke", "black")
                  .on('click', function(){
                    displayStateInfo(this.id);
                    $('#key').hide();
                    $('path').css('fill', 'gray');
                    $(this).css("fill", "turquoise");
                  });
              })
      })
});

$(function(){

 // $('.state-choice').on('click', function(){
  // console.log("click");
  //   var state = $(this).text();
  //   displayStateInfo(state);
  //   $('path').css('fill', 'gray');
  //   var selector = "#" + createSlug(state);
  //   $(selector).css("fill", "turquoise");
  //   });
  //
  //
  // $('.view_option').click(function(){
  //   var id = this.id;
  //   colorCodeMap(id);
  // });
  //
  $('body').on('click','#reset', function(){
    $('path').css("fill", "gray");
    // $("#display-key").empty();
    // $("#state_data").empty();
    // $('#about').show();
  })
  //
  // $('.dropdown-toggle').dropdown();
  //
  // // Fix input element click problem
  // $('.dropdown input, .dropdown label').click(function(e) {
  //   e.stopPropagation();
  // });



});
