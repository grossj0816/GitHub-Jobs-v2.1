import 'package:flutter/material.dart';
import './job_listing.dart';


class JobSearch extends StatefulWidget
{
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _JobSearchState();
    }
}


class _JobSearchState extends State<JobSearch>
{
  
  final _formkey = GlobalKey<FormState>();

  String _jobtitle;
  String _location;



  void submit()
  {
    final form = _formkey.currentState;
    if (form.validate())
    {
      form.save();

      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
      JobListing(_jobtitle, _location)));

    }
  }
  
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('GitHub Jobs'),
          centerTitle: true,
          backgroundColor: Color(0xFF2B414F),
        ),
        body: Form(
          key: _formkey,
          child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: Image.asset('assets/github.png', height: 100.0, width: 100.0),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: TextFormField(
                      validator: (value)
                      {
                        if (value != "")
                        {
                          return null;
                        }
                        else
                        {
                          return "This field can't be empty.";
                        }
                      },
                      onSaved: (value) =>  _jobtitle = value,
                      decoration: const InputDecoration(
                        hintText: 'Job Ttitle, Language, Etc.',
                        labelText: 'Job Title',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: TextFormField(
                      validator: (value)
                      {
                        if ( value != "")
                        {
                          return null;
                        }
                        else
                        {
                          return "This field can't be empty.";
                        }
                      },
                      onSaved: (value) => _location = value,
                      decoration: const InputDecoration(
                        hintText: 'San Fransicso, New York, Etc.',
                        labelText: 'Location'
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: RaisedButton(
                      child: Text('Search Jobs'),
                      color: Color(0xFF2B414F),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                      ),
                      onPressed: submit,
                    ),
                  )
                ],
              ), 
          ),
      );
    }
}