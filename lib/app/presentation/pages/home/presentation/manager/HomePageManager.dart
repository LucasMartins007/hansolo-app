import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class HomePageManager {
  final dio = Dio();

  void redirectTo(BuildContext context, var anotherClass) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => anotherClass));
  }

  Future<void> pickFile() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(initialDirectory: 'Documents');
      if (result != null) {
        print("Arquivo selecionado e enviado para a api..");
      }
    } catch (e) {
      print("Erro ao selecionar o arquivo: $e");
    }
  }

  Future<void> sendXlsxAsMultipart(FilePickerResult result) async {
    final url =
        'https://hansolo-api-c78f8661ac8b.herokuapp.com/api/excel/upload';
    final xmlFile = File(result.files.first.path!);

    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          xmlFile.path,
          filename: 'Planilha.xlsx',
          contentType: DioMediaType('application', 'multipart/form-data'),
        ),
      });

      final response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Arquivo XML enviado com sucesso!');
      } else {
        print('Erro ao enviar XML: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }
}
