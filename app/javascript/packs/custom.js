$(document).ready(function() {
  $('#bug_bug_type').change(function(event){
    var selectedVal = $("#bug_bug_type option:selected").val();
    if (selectedVal == "Feature")
     { $("#bug_status").html("<option value='New'>New</option><option value='Started'>Started</option><option value='Completed'>Completed</option>");}
    else
     { $("#bug_status").html("<option value='New'>New</option><option value='Started'>Started</option><option value='Resolved'>Resolved</option>");}
  });
});
