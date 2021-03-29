//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

//this page contains pdf files
class FilePage extends StatefulWidget {
  @override
  String titlePage;
  FilePage(this.titlePage);
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FilePageState(titlePage);
  }
}

class _FilePageState extends State<FilePage> {
  String titlePage;
  _FilePageState(this.titlePage);

  // String _fileName;
  // List<PlatformFile> _paths;
  // String _directoryPath;
  // String _extension;
  // bool _loadingPath = false;
  // bool _multiPick = false;
  // FileType _pickingType = FileType.any;
  // TextEditingController _controller = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   _controller.addListener(() => _extension = _controller.text);
  // }

  // void _openFileExplorer() async {
  //   setState(() => _loadingPath = true);
  //   try {
  //     _directoryPath = null;
  //     _paths = (await FilePicker.platform.pickFiles(
  //       type: _pickingType,
  //       allowMultiple: _multiPick,
  //       allowedExtensions: (_extension?.isNotEmpty ?? false)
  //           ? _extension?.replaceAll(' ', '')?.split(',')
  //           : null,
  //     ))
  //         ?.files;
  //   } on PlatformException catch (e) {
  //     print("Unsupported operation" + e.toString());
  //   } catch (ex) {
  //     print(ex);
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     _loadingPath = false;
  //     _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //folder name on bar
          title: Text(
            titlePage,
            style: TextStyle(fontSize: 25, fontFamily: "Helvetica"),
          ),
          backgroundColor: Color.fromRGBO(133, 151, 120, 5)),
      body: Center(
        child: Column(children: [
          RaisedButton(
            color: Color.fromRGBO(100, 127, 92, 5),
            child: Text(
              "Back",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ]),
      ),
      //upload file button
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FittedBox(
            child: FloatingActionButton(
          child: Icon(Icons.file_upload),
          onPressed: () {},
          backgroundColor: Color.fromRGBO(100, 127, 92, 5),
        )),
      ),
      //upload file button alignment
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
