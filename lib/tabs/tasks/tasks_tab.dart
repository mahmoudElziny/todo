import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:todo/tabs/tasks/task_item.dart';

class TasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineCalendar(
          calendarType: CalendarType.GREGORIAN,
          calendarLanguage: "en",
          calendarOptions: CalendarOptions(
            viewType: ViewType.DAILY,
            toggleViewType: true,
            headerMonthElevation: 10,
            headerMonthShadowColor: Colors.black26,
            headerMonthBackColor: Colors.transparent,
          ),
          dayOptions: DayOptions(
            compactMode: true,
            weekDaySelectedColor: Theme.of(context).primaryColor,
            selectedBackgroundColor: Theme.of(context).primaryColor,
            disableDaysBeforeNow: false,
          ),
          headerOptions: HeaderOptions(
              weekDayStringType: WeekDayStringTypes.SHORT,
              monthStringType: MonthStringTypes.FULL,
              backgroundColor: Theme.of(context).primaryColor,
              headerTextColor: Colors.black),
          onChangeDateTime: (datetime) {
            print(datetime.getDate());
          },
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => TaskItem(),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
