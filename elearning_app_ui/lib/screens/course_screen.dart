import 'package:elearning_app_ui/widgets/course_container.dart';
import 'package:elearning_app_ui/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/course.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => CourseScreenState();
}

class CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Stack(
                  children: [
                    Align(
                      child: Text(
                        'Development',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, int index) {
                  return CourseContainer(course: courses[index]);
                },
                separatorBuilder: (context, _) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: courses.length,
              )),
              Positioned(
                  left: 0,
                  child: CustomIconButton(
                    child: Icon(Icons.arrow_back),
                    height: 35,
                    width: 35,
                    onTap: () => Navigator.pop(context),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
