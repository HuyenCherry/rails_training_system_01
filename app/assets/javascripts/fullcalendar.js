var initialize_calendar;
initialize_calendar = function() {
  
  $(".calendar").each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      header: {
        left: "prev,next today",
        center: "title",
        right: "month,agendaWeek,agendaDay"
      },

      weekends: false,
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      user_reports: "/user_reports",


      select: function(start, end) {
        $.getScript("/user_reports/new", function() {});
        calendar.fullCalendar("unselect");
      },

      views: {
        timelineThreeDays: {
          type: 'timeline',
          duration: { days: 3 }
        }
      },

      events: '/user_reports',

      events: [
        {
          id: '1',
          title: 'Meeting',
          start: '2018-08-22'
        },
        {
          id: '2',
          title: 'Huyen Cherry',
          start: '2018-08-16'
        },
        {
          id: '3',
          title: 'Huyen Cherry',
          start: '2018-08-14'
        }
      ],

      

      eventDrop: function(user_report, delta, revertFunc) {
        event_data = {
          user_report: {
            id: user_report.id,
            start: user_report.start.format(),
            end: user_report.end.format()
          }
        };
        $.ajax({
            url: user_report.update_url,
            data: event_data,
            type: "PATCH"
        });
      },

      eventClick: function(user_report, jsEvent, view) {
        $.getScript(user_report.edit_url, function() {});
      },
    });
  })
};



$(document).on('turbolinks:load', function() {
  initialize_calendar();
});
