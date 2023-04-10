import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/esen/esen_theme.dart';
import '/esen/esen_util.dart';
import '/esen/esen_widgets.dart';
import '/esen/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompleteProfileModel extends EsenModel {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  ESENUploadedFile uploadedLocalFile =
      ESENUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for imageURL widget.
  TextEditingController? imageURLController;
  String? Function(BuildContext, String?)? imageURLControllerValidator;
  // State field(s) for displayName widget.
  TextEditingController? displayNameController;
  String? Function(BuildContext, String?)? displayNameControllerValidator;
  // State field(s) for yourTitle widget.
  TextEditingController? yourTitleController;
  String? Function(BuildContext, String?)? yourTitleControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    imageURLController?.dispose();
    displayNameController?.dispose();
    yourTitleController?.dispose();
  }

  /// Additional helper methods are added here.

}
