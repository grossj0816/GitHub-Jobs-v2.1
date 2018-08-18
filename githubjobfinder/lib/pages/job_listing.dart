import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// TODO: IMPORT THE JOB DESC FILE
import 'dart:async';
import 'dart:convert';

import 'job_description.dart';


class JobListing extends StatefulWidget
{
  final String passedJobTitle;
  final String passedLocation;


  JobListing(this.passedJobTitle, this.passedLocation);


  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _JobListingState();
    }
}

class _JobListingState extends State<JobListing>
{
  List jobListingData;
  var isLoading = false;

  Future<String> getJsonData() async{
     
     setState(() 
     {
        isLoading = true;       
     });

     final response = await http.get('https://jobs.github.com/positions.json?description=${widget.passedJobTitle}&location=${widget.passedLocation}');
    

     if (response.statusCode == 200)
     {
        jobListingData = json.decode(response.body);
        setState(() 
        {
          isLoading = false;              
        });
     }
     else
     {
        throw Exception('Failed to load listings');          
     }

     return 'Success';
  }  

  @override
    void initState() {
      // TODO: implement initState
      this.getJsonData();
      super.initState();
    }


  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('Job Listings'),
          centerTitle: true,
          backgroundColor: Color(0xFF2B414F),
        ),
        body: isLoading ?
         Center(
           child: CircularProgressIndicator(),
         ) 
         : ListView.builder(
            itemCount:jobListingData == null ? 0 : jobListingData.length,
            itemBuilder: (BuildContext context, int index)
            {
              return Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                       Card(
                         elevation: 3.0,
                         margin: EdgeInsets.all(5.0),
                        child: Column(       
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                jobListingData[index]['title'], 
                              style: TextStyle(fontSize: 22.0,
                               fontStyle: FontStyle.italic, 
                               fontWeight: FontWeight.w400
                              ,) 
                             )
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 10.0),                              
                              child: Text(
                                jobListingData[index]['company'],
                              style: TextStyle(fontSize: 18.0)                              
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(
                                jobListingData[index]['location'], 
                              style: TextStyle(fontSize: 18.0)
                              )  
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 10.0),
                              alignment: Alignment.centerRight,
                              child: Text(
                                jobListingData[index]['type'],
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18.0
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              child: RaisedButton(
                                child: Text('View More'),
                                color: Color(0xFF2B414F),
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)
                                ),
                                onPressed: ()
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => JobDescription(jobListingData[index]['title'],jobListingData[index]['company'], jobListingData[index]['location'], jobListingData[index]['description'])));
                                },                             
                              ),
                            )
                          ],
                        )
                      ,)
                    ],
                  ),
                ),
              );
            },
        )
      );
    }
}