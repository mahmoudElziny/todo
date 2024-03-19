import 'package:flutter/material.dart';
import 'package:todo/app_theme.dart';

class TaskItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 60,
            color: Theme.of(context).primaryColor,
            margin: EdgeInsetsDirectional.only(end: 12),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Task Item",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Task Desc",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          Spacer(),
          Container(
            child: Image.asset('assets/images/icon_check.png'),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 69,
            height: 34,
          ),
        ],
      ),
    );
  }
}
