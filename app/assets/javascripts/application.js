// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require foundation
//= require moment 
//= require fullcalendar
//= require fullcalendar/locale-all
//= require foundation-datetimepicker
//= require appointments

function clearCalendar() {
  $('#calendar').fullCalendar('delete'); // In case delete doesn't work.
  $('#calendar').html('');
};

$(document).on('turbolinks:load', function() {
    $(function(){ $(document).foundation(); });
    $('#calendar').fullCalendar({
        events: '/appointments.json',
        defaultView: 'agendaWeek',
        // event dragging & resizing
        // editable: true,
        // header
        axisFormat: 'h:mm t',
        slotLabelFormat:'h:mm t',
        timeFormat: 'h:mm t',
        header: {
            left: 'title',
            center: 'month,agendaWeek,agendaDay',
            right: 'today prev,next'
        },
        timeZone: 'America/New_York',
        locale: 'es'
    });

    $('#date_time_human').fdatetimepicker({
        startDate: '2020-07-20',
        format: 'dd MM yyyy, HH:ii p',

        disableDblClickSelection: true,
		leftArrow:'<<',
		rightArrow:'>>',
		closeIcon:'X',
        closeButton: true,
        language: 'es',
        showMeridian:true,
        minuteStep:15,
        autoclose: true
    });
    $('#time_picker').fdatetimepicker({
        startDate: '00:00',
        format: 'hh:ii',
        disableDblClickSelection: true,
        startView:0,
        minView:0,
        maxView:0,
		leftArrow:'<<',
		rightArrow:'>>',
		closeIcon:'X',
        closeButton: true,
        language: 'es',
        showMeridian:true,
        minuteStep:15,
        autoclose: true
    });
    function completedStyle(){
        $("#statusBttn").empty();  
        if($("#statusSwitch").is(":checked")) {            
            $("#statusBttn").append("<span>Completada<i style='margin-left:15px;' class='fi-check large'></i></span>");   
            $("#statusBttn").addClass("success");
            $("#statusBttn").removeClass("secondary"); 
        }else{
            $("#statusBttn").append("<span>Completar</span>");   
            $("#statusBttn").addClass("secondary");
            $("#statusBttn").removeClass("success"); 
        }
    }
    completedStyle();
    $("#statusSwitch").change(function(){
        completedStyle();
    });
    

    
});
$(document).on('turbolinks:before-cache', clearCalendar)