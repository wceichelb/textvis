// google.charts.setOnLoadCallback(drawChart);

function drawChart(inpWord='') {
  var data = google.visualization.arrayToDataTable(_.zip.apply(_, window.rawdata));

  var options = {
    wordtree: {
      format: 'implicit',
      word: inpWord
    }
  };

  var chart = new google.visualization.WordTree(document.getElementById('vis_div'));
  chart.draw(data, options);
}

function loadTree(word=nil) {
  $("#vis_div").html("");

  drawChart(word);
}

function loadCloud(word_array) {
  $("#vis_div").html("");

  $("#vis_div").jQCloud(word_array);
}
