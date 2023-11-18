import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer(String pPregunta, String pUrlServerIA) async {
    String urlChatGPT = '$pUrlServerIA/chat?pregunta=$pPregunta';

    final responseGPT = await _dio.get(urlChatGPT);
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    yesNoModel.setRespuesta = responseGPT.data.toString();

    return yesNoModel.toMessageEntity();
  }
}
