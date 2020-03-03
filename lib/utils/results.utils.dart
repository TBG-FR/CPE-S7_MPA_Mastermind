
import 'package:flutter_app/model/result.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/results.model.dart';
import 'dart:io';
import 'dart:convert'; //to convert json to maps and vice versa
import 'package:path_provider/path_provider.dart'; //add path provider dart plugin on pubspec.yaml file

class ResultsManager
{
  static final String fileName = "MastermindScores.json";
  static Directory dir;
  static File fileJSON;

  static Future<File> getFile() async
  {
    if(fileJSON == null || fileJSON.existsSync() == false)
    {
      Directory dir = await getApplicationDocumentsDirectory();
      fileJSON = new File(dir.path + "/" + fileName);
      fileJSON.createSync();
    }

    return fileJSON;
  }

  static Future addResult(ResultModel resultModel) async {

    ResultsModel results = await getResults();
    results.results.add(resultModel);

    getFile()
        .then((File file) { file.writeAsString/*Sync*/(jsonEncode(results.toJson())); })
        .catchError((e) { print(e.error); });
  }

  static Future<ResultsModel> getResults() async
  {
    ResultsModel results;

    try
    {
      File file = await getFile();
      results = ResultsModel.fromJson(jsonDecode(file.readAsStringSync()));
    }
    catch(on, StackTrace)
    {
      // TODO LOG ?
      print(on);
      print(StackTrace);
      results = new ResultsModel.empty();
    }

    return results;
  }

//    Map<String, String> results = jsonDecode(fileJSON.readAsStringSync());
//
//    getApplicationDocumentsDirectory().then((Directory directory)
//    {
//      dir = directory;
//      fileJSON = new File(dir.path + "/" + fileName);
//      if(fileJSON.existsSync() == false)
//      {
//        fileJSON.createSync();
//      }
////      fileExists = jsonFile.existsSync();
////      if (fileExists) this.setState(() => fileContent = jsonDecode(jsonFile.readAsStringSync()));
//    });
//
//    //print("Creating file!");
//    File file = new File(dir.path + "/" + fileName);
//    file.createSync();
//    fileExists = true;
//    file.writeAsStringSync(jsonEncode(content));
//  }

//  File jsonFile;
//  Directory dir;
//  String fileName = "myJSONFile.json";
//  bool fileExists = false;
//  Map<String, String> fileContent;

//  @override
//  void initState() {
//    super.initState();
//    /*to store files temporary we use getTemporaryDirectory() but we need
//    permanent storage so we use getApplicationDocumentsDirectory() */
//    getApplicationDocumentsDirectory().then((Directory directory) {
//      dir = directory;
//      jsonFile = new File(dir.path + "/" + fileName);
//      fileExists = jsonFile.existsSync();
//      if (fileExists) this.setState(() => fileContent = jsonDecode(jsonFile.readAsStringSync()));
//    });
//  }
//
//  void createFile(Map<String, String> content, Directory dir, String fileName) {
//    //print("Creating file!");
//    File file = new File(dir.path + "/" + fileName);
//    file.createSync();
//    fileExists = true;
//    file.writeAsStringSync(jsonEncode(content));
//  }
//
//  void writeToFile(String key, String value) {
//    print("Writing to file!");
//    Map<String, String> content = {key: value};
//    if (fileExists) {
//      print("File exists");
//      Map<String, String> jsonFileContent = json.decode(jsonFile.readAsStringSync());
//      jsonFileContent.addAll(content);
//      jsonFile.writeAsStringSync(jsonEncode(jsonFileContent));
//    } else {
//      print("File does not exist!");
//      createFile(content, dir, fileName);
//    }
//    this.setState(() => fileContent = jsonDecode(jsonFile.readAsStringSync()));
//    print(fileContent);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(title: new Text("JSON Tutorial"),),
//      body: new Column(
//        children: <Widget>[
//          new Padding(padding: new EdgeInsets.only(top: 10.0)),
//          new Text("File content: ", style: new TextStyle(fontWeight: FontWeight.bold),),
//          new Text(fileContent.toString()),
//          new Padding(padding: new EdgeInsets.only(top: 10.0)),
//          new Text("Add to JSON file: "),
//          new TextField(
//            controller: keyInputController,
//          ),
//          new TextField(
//            controller: valueInputController,
//          ),
//          new Padding(padding: new EdgeInsets.only(top: 20.0)),
//          new RaisedButton(
//            child: new Text("Add key, value pair"),
//            onPressed: () => writeToFile(keyInputController.text, valueInputController.text),
//          )
//        ],
//      ),
//    );
//  }
}
