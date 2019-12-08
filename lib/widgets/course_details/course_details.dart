import 'package:flutter/material.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'RECOGNITION TEST.\nTHE BASICS',
            style: TextStyle(
                fontWeight: FontWeight.w800, height: 0.9, fontSize: 80),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed convallis magna eu semLorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed convallis magna eu sem. Etiam ligula pede, sagittis quis, interdum ultricies, scelerisque eu. Integer lacinia. Nulla quis diam. Aliquam id dolor. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt..",
            style: TextStyle(fontSize: 21, height: 1.7),
          )
        ],
      ),
    );
  }
}
