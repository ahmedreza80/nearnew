$(document).on('change', '.js-state', function(){
  getCities($(".js-state").val());
  $(".js-location").html(buildOptionsHtml([[null, "Select a location"]]));
  return null;
});

$(document).on('change', '.js-city', function(){
  getLocations($(".js-city").val());
});

function getCities(state_id){
  setHtmlOptionsFor(state_id, 'state', 'city');
  return null;
}

function getLocations(city_id){
  setHtmlOptionsFor(city_id, 'city', 'location');
  return null;
}

function setHtmlOptionsFor(id, upperType, lowerType){
  id = (id == "" ? null : id);
  $.get(getLocationURLFor(id, upperType, lowerType), function(data){
    data.unshift([null, "Select a " + lowerType]);
    $(".js-" + lowerType).html(buildOptionsHtml(data));
    return null;
  });
  return null;
}

function getLocationURLFor(id, upperType, lowerType){
  return ("/" + upperType.replace(/y$/, "ie") + "s/" + id + "/" + lowerType.replace(/y$/, "ie") + "s");
}

function buildOptionsHtml(data){
  return $.map(data, function(d){
    return "<option value='" + d[0] + "'>" + d[1] + "</option>";
  }).join("");
}
