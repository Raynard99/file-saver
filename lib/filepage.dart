import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'pdfviewer.dart';

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
  List<PlatformFile> _paths = [];
  List<String> pdf = ["pdf"];
  // bool _loadingPath = false;
  // TextEditingController _controller = TextEditingController(text: 'pdf');

  void _openFileExplorer() async {
    setState(() {}
        // => _loadingPath = true
        );
    try {
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
      // _loadingPath = false;
      // _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
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

  void delete(PlatformFile data) {
    setState(() {
      _paths.remove(data);
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
      body: _paths.length == 0
          ? Text("")
          : ListView.builder(
              itemCount: _paths.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: GestureDetector(
                      onTap: () {
                        PlatformFile passData = _paths[index];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewPdf(passData),
                                settings: RouteSettings()));
                      },
                      child: Stack(
                        children: [
                          Slidable(
                            child: Center(
                              child: Container(
                                height: 100,
                                child: Card(
                                  margin: EdgeInsets.all(10),
                                  elevation: 7.0,
                                  child: Center(
                                    child: Text(_paths[index].name),
                                  ),
                                ),
                              ),
                            ),
                            actionPane: SlidableDrawerActionPane(),
                            actionExtentRatio: 0.5,
                            controller: SlidableController(),
                            secondaryActions: [
                              IconSlideAction(
                                caption: 'Delete',
                                color: Colors.redAccent,
                                icon: Icons.delete_sharp,
                                onTap: () {
                                  delete(_paths[index]);
                                },
                                closeOnTap: true,
                              )
                            ],
                          ),
                        ],
                      ),
                    ));
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // clear cache file button
            Container(
                // height: 70,
                // width: 70,
                child: FittedBox(
                    child: FloatingActionButton(
                        backgroundColor: Color.fromRGBO(100, 127, 92, 5),
                        onPressed: () => _clearCachedFiles(),
                        child: Icon(Icons.cleaning_services)))),
            // upload file button
            Container(
                height: 70,
                width: 70,
                child: FittedBox(
                    child: FloatingActionButton(
                  backgroundColor: Color.fromRGBO(100, 127, 92, 5),
                  onPressed: () => _openFileExplorer(),
                  child: Icon(Icons.file_upload),
                ))),
          ],
        ),
      ),
    );
  }
}
