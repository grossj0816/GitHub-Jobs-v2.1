import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


class JobDescription extends StatefulWidget
{

  final String title;
  final String companyName;
  final String description;
  final String location;


  JobDescription(this.title, this.companyName, this.location, this.description);

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _JobDescState();
    }
}


class _JobDescState extends State<JobDescription>
{ 
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('Job Description'),
          centerTitle: true,
          backgroundColor: Color(0xFF2B414F),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Container(
              child: Text(
                '${widget.companyName} - ${widget.location}',
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 5.0, top: 10.0),
              child: Html(
                  data: 
                  """
                    ${widget.description}                  
                  """,
                  defaultTextStyle: 
                  TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    decorationColor: Colors.black,
                    color: Colors.black
                  ),
              ),
            )
          ],
        )
      );
    }
}