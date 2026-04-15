import 'dart:io';
import 'package:syncfusion_flutter_pdf/pdf.dart';

Future<String> getPdfPageCount(File file) async {
  final bytes =  await file.readAsBytes();

  final document = PdfDocument(inputBytes: bytes);

  int count = document.pages.count;


  document.dispose();

  return "$count pages";
}