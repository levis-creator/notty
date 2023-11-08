import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:notty/styles/styles.dart';
import 'package:get_time_ago/get_time_ago.dart';

// ignore: must_be_immutable
class NoteWidget extends StatelessWidget {
  NoteWidget(
      {super.key,
      required this.data,
      required this.index,
      required this.deleteNote});
  final int index;
  Function(BuildContext)? deleteNote;

  Map data = <String, dynamic>{};

  String? dateTime(DateTime date) {
    var converted = DateTime.parse(date);
    var result = GetTimeAgo.parse(converted);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: deleteNote,
          icon: Icons.delete,
          label: 'Delete',
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.amber[200],
              borderRadius: BorderRadius.circular(10)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['title'],
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const Gap(20),
                      Text(
                        dateTime(data['createDate']).toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Styles.headLineStyle3.copyWith(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
              ),
            ),
            const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.black26,
                  ),
                  Gap(20),
                  Icon(
                    Icons.edit,
                    color: Colors.black26,
                  )
                ]),
          ]),
        ),
      ),
    );
  }
}
