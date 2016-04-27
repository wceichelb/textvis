function drawChart(inpWord='', root='suffix') {
  console.log(inpWord, root);
  var data = google.visualization.arrayToDataTable(_.zip.apply(_, rawdata));
  var options = {
    wordtree: {
      format: 'implicit',
      word: inpWord,
      type: root
    }
  };

  var chart = new google.visualization.WordTree(document.getElementById('vis_div'));
  chart.draw(data, options);
}

function loadTree(word, root) {
  $("#vis_div").html("");
  $("#tree-root-control").show();

  drawChart(word, root);
}

function loadCloud(word_array) {
  $("#vis_div").html("");
  $("#tree-root-control").hide();

  $("#vis_div").jQCloud(word_array);
}

