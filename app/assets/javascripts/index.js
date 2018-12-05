var ready = function(){
  if ($("#task_measure").val() != "Custom") {
    $('#task_custom_measure').parent().hide()
  }
  $("#task_measure").change(function(){
    if ($("#task_measure").val()=='Custom') {
      $('#task_custom_measure').parent().show("slow");
    } else {
      $('#task_custom_measure').parent().hide("slow");
    }
  });
  var count=0;
  $("#admin_add").click(function(){
    if (count!=0) {return;}
    count=1;
    $.post(
      "/admin/update",
      {"email": $("#email_admin").val(), "func":"add"},
      function(data,status) {

        if (status == "success"){
          alert("successfully Added Admin");
          location.reload();
        } else {
          alert(data);
        }
      }
    );
    count=1;
    });
    $("#admin_Remove").click(function(){
      if(count!=0) {return;}
      count=1
      $.post(
        "/admin/update",
        {"email": $("#email_admin").val(), "func":"remove"},
        function(data,status) {
        count=0;
          if (status == "success"){
            alert("successfully Removed Admin");
            location.reload();
          } else {
            alert(data);
          }
        }
      );
    });
};
$(document).ready(ready)
$(document).on('turbolinks:load',ready)
