import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  String _fileName;
  List<PlatformFile> _paths = [];
  String _directoryPath;
  List<String> pdf = ["pdf"];
  bool _loadingPath = false;
  // TextEditingController _controller = TextEditingController(text: 'pdf');

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowMultiple: true,
              allowedExtensions: pdf))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
    });
  }

  void _clearCachedFiles() {
    FilePicker.platform.clearTemporaryFiles().then((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: result ? Colors.green : Colors.red,
          content: Text((result
              ? 'Temporary files removed with success.'
              : 'Failed to clean temporary files')),
        ),
      );
    });
  }

  // void _selectFolder() {
  //   FilePicker.platform.getDirectoryPath().then((value) {
  //     setState(() => _directoryPath = value);
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
          new Builder(
            builder: (BuildContext context) => _loadingPath
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: const CircularProgressIndicator())
                : _paths != null
                    ? new Container(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: new Scrollbar(
                            child: new ListView.separated(
                          itemCount: _paths != null && _paths.isNotEmpty
                              ? _paths.length
                              : 1,
                          itemBuilder: (BuildContext context, int index) {
                            final bool isMultiPath =
                                _paths != null && _paths.isNotEmpty;
                            final String name = (isMultiPath
                                ? _paths.toList()[index].name
                                : _fileName ?? '...');
                            return new ListTile(
                              title: new Text(
                                name,
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              new Divider(),
                        )),
                      )
                    : new Container(),
          ),
          // RaisedButton(
          //   color: Color.fromRGBO(100, 127, 92, 5),
          //   child: Text(
          //     "Back",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          ElevatedButton(
              onPressed: () {
                print(_paths[0].name);
              },
              child: Text("print data"))
        ]),
      ),
      //upload file button
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FittedBox(
            child: FloatingActionButton(
          child: Icon(Icons.file_upload),
          onPressed: () => _openFileExplorer(),
          backgroundColor: Color.fromRGBO(100, 127, 92, 5),
        )),
      ),
      //upload file button alignment
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
