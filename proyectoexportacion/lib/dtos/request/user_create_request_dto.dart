import 'dart:convert';

EnvioCreateDto userCreateRequestDtoFromJson(String str) =>
    EnvioCreateDto.fromJson(json.decode(str));

String userCreateRequestDtoToJson(EnvioCreateDto data) =>
    json.encode(data.toJson());

class EnvioCreateDto {
  EnvioCreateDto({
    required this.title,
    required this.weightContent,
  });

  final String title;
  final String weightContent;

  factory EnvioCreateDto.fromJson(Map<String, dynamic> json) => EnvioCreateDto(
        title: json["Nombre"],
        weightContent: json["Peso"],
      );

  Map<String, String> toJson() => {
        "Nombre": title,
        "Peso": weightContent,
      };
}
