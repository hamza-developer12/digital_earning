import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_earning/Helper/ui_helper.dart';
import 'package:digital_earning/services/api_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
class AssignmentProvider extends ChangeNotifier {
  bool loading = false;
  File? file;
  bool downloading = false;
  final apiServices = ApiServices();
  bool fileSelected = false;
  String name = '';
  Dio dio = Dio();
  List<dynamic> assignments = [];

  Future<void> getFile() async {
    FilePickerResult? filePicker = await FilePicker.platform.pickFiles();

    if (filePicker != null) {
      file = File(filePicker.files.single.path!);
      name = filePicker.files.first.name;
      fileSelected = true;
      notifyListeners(); // Notify listeners after file selection
    }
  }

  Future<void> uploadAssignment(BuildContext context, String assignmentName, String amount) async {
    try {
      loading = true;
      notifyListeners();

      if (file == null) {
        UiHelper.errorFlushMessage(context, "Please select a file first");
      } else {
        String fileName = path.basename(file!.path);

        String uniqueFileName = '${DateTime.now().millisecondsSinceEpoch}_$fileName';
        final ref = FirebaseStorage.instance.ref().child('assignments/$uniqueFileName');

        await ref.putFile(file!);
        final url = await ref.getDownloadURL();

        await apiServices.addRecord(
          "assignments",
          null,
          {
            "assignmentName": assignmentName,
            "amount": int.parse(amount),
            "fileUrl": url,
            "createdAt": DateTime.now(),
          },
        );

        UiHelper.successFlushMessage(context, "Assignment Uploaded Successfully");
      }
    } catch (error) {
      UiHelper.errorFlushMessage(context, "Error: $error");
    } finally {
      loading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners(); // Notify after the current frame
      });
    }
  }

  Future<void> getAllAssignments() async {
    try {
      loading = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners(); // Notify after the current frame
      });

      assignments = await apiServices.getRecords("assignments");

    } catch (error) {
      // print("Error fetching assignments: $error");
    } finally {
      loading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners(); // Notify after the current frame
      });
    }
  }

  Future<void> deleteAssignment(BuildContext context, String name, String filePath) async {
    try {
      loading = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners(); // Notify after the current frame
      });

      Reference fileRef = FirebaseStorage.instance.refFromURL(filePath);
      print(fileRef.name);


      await fileRef.delete();
      bool deleted = await apiServices.deleteRecordWhere("allocated_assignments", "assignmentName", name);
      if (deleted) {
        await apiServices.deleteRecordWhere("assignments", "assignmentName", name);
        // UiHelper.successFlushMessage(context, "Assignment Deleted Successfully");
      } else {
        await apiServices.deleteRecordWhere("assignments", "assignmentName", name);
        // UiHelper.successFlushMessage(context, "Assignment Deleted Successfully");
      }
      getAllAssignments();
    } catch (error) {
      print(error);
      UiHelper.errorFlushMessage(context, "Failed To Delete");
    } finally {
      loading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners(); // Notify after the current frame
      });
    }
  }

  Future<void> downloadFile(BuildContext context, String url) async {
    try {
      // Extract the file name from the URL
      String fileName = Uri.parse(url).pathSegments.last;

      // Set the file path to save in the internal storage's Downloads folder
      Directory downloadsDir = Directory('/storage/emulated/0/Download');
      String filePath = '${downloadsDir.path}/$fileName';

      // Use Dio to download the file
      Dio dio = Dio();
      await dio.download(url, filePath, onReceiveProgress: (received, total) {
        if (total != -1) {
          print('Downloading: ${(received / total * 100).toStringAsFixed(0)}%');
        }
      });
      UiHelper.successFlushMessage(context, "File Downloaded Successfully");
    } catch (e) {
      UiHelper.errorFlushMessage(context, "Error Downloading File");
    }
  }

  Future<void> uploadSolution(BuildContext context, String name) async {
    try {
      loading = true;
      notifyListeners();

      if (file == null) {
        UiHelper.errorFlushMessage(context, "Please select a file first");
      } else {
        String fileName = path.basename(file!.path);

        String uniqueFileName = '${DateTime.now().millisecondsSinceEpoch}_solution_${fileName}';
        final ref = FirebaseStorage.instance.ref().child('solutions/$uniqueFileName');

        await ref.putFile(file!);
        final url = await ref.getDownloadURL();
        final collectionRef = FirebaseFirestore.instance.collection("solutions");
        String docId = collectionRef.doc().id;
        await apiServices.addRecord("solutions", docId,
            {
              "assignmentName": name,
              "solutionFile": url,
              "userName": FirebaseAuth.instance.currentUser!.displayName,
              "userEmail": FirebaseAuth.instance.currentUser!.email
            }
        );

        UiHelper.successFlushMessage(context, "Solution Uploaded Successfully");
      }
    } catch (error) {
      UiHelper.errorFlushMessage(context, "Error: $error");
    } finally {
      loading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners(); // Notify after the current frame
      });
    }
  }
}
