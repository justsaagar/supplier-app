import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:supplier/app/widget/app_app_bar.dart';

class PdfUploadScreen extends StatelessWidget {
  final File pdfPath;

  const PdfUploadScreen({Key? key, required this.pdfPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Invoice'),
      body: PDFView(filePath: pdfPath.path),
    );
  }
}
