import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  // Setter para modificar el valor del atributo
  set setRespuesta(String nuevoValor) {
    answer = nuevoValor;
  }

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };
  Message toMessageEntity() => Message(
      //text: answer == 'yes' ? 'Si' : 'No',
      text: answer,
      fromWho: FromWho.hers,
      imageUrl: image);
}
