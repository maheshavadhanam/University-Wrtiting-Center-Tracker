$(document).ready(function(){
  $('.timer').countimer({
    autoStart : false
  })
  $('.timer').bind("DOMSubtreeModified",function(){
    var time = $(".timer").html().toString();
    var sec = time.split(":")[2]
    var min = time.split(":")[1]
    var hour = time.split(":")[0]
    $("#seconds").html(parseInt(sec));
    $("#minutes").html(parseInt(min));
    $("#hour").html(parseInt(hour));
    $("#prog-sec").attr("data-percentage",parseInt(parseInt(sec)*100/60));
    $("#prog-min").attr("data-percentage",parseInt(parseInt(min)*100/60));
    $("#prog-hour").attr("data-percentage",parseInt(parseInt(hour)*100/24));
});
  $('#timer_stop').click(function() {
    console.log(JSON.stringify($(".timer").countimer('current')['displayedMode']['unformatted']));
      var time = $(".timer").countimer('current')['displayedMode']['unformatted'];
      $('#task_hour').val(time['hours'])
      $('#task_min').val(time['minutes'])
      $('#task_sec').val(time['seconds'])
      $('.timer').html("00:00:00")
  });
});
