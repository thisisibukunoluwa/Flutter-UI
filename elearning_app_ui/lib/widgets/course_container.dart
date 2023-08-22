import 'package:elearning_app_ui/constants/color.dart';
import 'package:elearning_app_ui/models/course.dart';
import 'package:flutter/material.dart';

class CourseContainer extends StatelessWidget {
  final Course course;
  const CourseContainer({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                course.thumbnail,
                height: 60,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child:Column(
                children: [
                  Text(course.name),
                  Text('Author ${course.author}',style: Theme.of(context).textTheme.bodySmall,),
                  SizedBox(
                    height: 5,
                  ),
                  LinearProgressIndicator(
                    value: course.completedPercentage,
                    backgroundColor: Colors.black12,
                    color: kPrimaryColor,
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
