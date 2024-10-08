import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

/// This widget is responsible for structuring the [NotificationCard].
class NotificationTile extends StatelessWidget {
  final String cardTitle;
  final String? format;
  final DateTime date;
  final String title;
  final Widget? leading;
  final String subtitle;
  final EdgeInsets? padding;
  final double height;
  final double spacing;
  final double cornerRadius;
  final Color color;
  final TextStyle titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final List<BoxShadow>? boxShadow;

  const NotificationTile({
    Key? key,
    required this.title,
    required this.cardTitle,
    required this.date,
    required this.subtitle,
    required this.height,
    required this.cornerRadius,
    required this.color,
    required this.titleTextStyle,
    required this.subtitleTextStyle,
    required this.boxShadow,
    this.leading,
    this.spacing = 0,
    this.padding,
    this.format
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: padding,
      height: null,
      padding: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(cornerRadius),
        boxShadow: boxShadow,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: titleTextStyle,
                  ),
                ),
                Text(
                  '${DateFormat(format ?? 'h:mm a').format(date)}',
                  style: kCardTopTextStyle,
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ListTile(
            leading: leading,
            title: null,
            subtitle: Text(
              subtitle,
              overflow: TextOverflow.visible,
              style: subtitleTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
