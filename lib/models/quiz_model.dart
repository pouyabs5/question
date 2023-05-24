class QuizModel {
  final String id;
  final List<Interaction> preInteraction;
  final InteractionModule interactionModule;
  final List<Interaction> postInteraction;
  final List<FileElement> files;
  final String type;
  final List<InteractionOption> interactionOptions;
  final List<String> wrongOptions;

  QuizModel({
    required this.id,
    required this.preInteraction,
    required this.interactionModule,
    required this.postInteraction,
    required this.files,
    required this.type,
    required this.interactionOptions,
    required this.wrongOptions,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        id: json["id"],
        preInteraction: List<Interaction>.from(
            json["preInteraction"].map((x) => Interaction.fromJson(x))),
        interactionModule:
            InteractionModule.fromJson(json["interactionModule"]),
        postInteraction: List<Interaction>.from(
            json["postInteraction"].map((x) => Interaction.fromJson(x))),
        files: List<FileElement>.from(
            json["files"].map((x) => FileElement.fromJson(x))),
        type: json["type"],
        interactionOptions: List<InteractionOption>.from(
            json["interactionOptions"]
                .map((x) => InteractionOption.fromJson(x))),
        wrongOptions: List<String>.from(json["wrongOptions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "preInteraction":
            List<dynamic>.from(preInteraction.map((x) => x.toJson())),
        "interactionModule": interactionModule.toJson(),
        "postInteraction":
            List<dynamic>.from(postInteraction.map((x) => x.toJson())),
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
        "type": type,
        "interactionOptions":
            List<dynamic>.from(interactionOptions.map((x) => x.toJson())),
        "wrongOptions": List<dynamic>.from(wrongOptions.map((x) => x)),
      };
}

class FileElement {
  final String codeLanguage;
  final bool isInteractive;
  final String content;
  final String name;

  FileElement({
    required this.codeLanguage,
    required this.isInteractive,
    required this.content,
    required this.name,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        codeLanguage: json["codeLanguage"],
        isInteractive: json["isInteractive"],
        content: json["content"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "codeLanguage": codeLanguage,
        "isInteractive": isInteractive,
        "content": content,
        "name": name,
      };
}

class InteractionModule {
  final List<FileElement> files;
  final String type;
  final List<InteractionOption> interactionOptions;
  final List<String> wrongOptions;

  InteractionModule({
    required this.files,
    required this.type,
    required this.interactionOptions,
    required this.wrongOptions,
  });

  factory InteractionModule.fromJson(Map<String, dynamic> json) =>
      InteractionModule(
        files: List<FileElement>.from(
            json["files"].map((x) => FileElement.fromJson(x))),
        type: json["type"],
        interactionOptions: List<InteractionOption>.from(
            json["interactionOptions"]
                .map((x) => InteractionOption.fromJson(x))),
        wrongOptions: List<String>.from(json["wrongOptions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
        "type": type,
        "interactionOptions":
            List<dynamic>.from(interactionOptions.map((x) => x.toJson())),
        "wrongOptions": List<dynamic>.from(wrongOptions.map((x) => x)),
      };
}

class InteractionOption {
  final TextModel text;
  final bool correctOption;

  InteractionOption({
    required this.text,
    required this.correctOption,
  });

  factory InteractionOption.fromJson(Map<String, dynamic> json) =>
      InteractionOption(
        text: TextModel.fromJson(json["text"]),
        correctOption: json["correctOption"],
      );

  Map<String, dynamic> toJson() => {
        "text": text.toJson(),
        "correctOption": correctOption,
      };
}

class TextModel {
  final int position;
  final int start;
  final int end;
  final int length;
  String text;

  TextModel({
    required this.position,
    required this.start,
    required this.end,
    required this.length,
    required this.text,
  });

  factory TextModel.fromJson(Map<String, dynamic> json) => TextModel(
        position: json["position"],
        start: json["start"],
        end: json["end"],
        length: json["length"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "start": start,
        "end": end,
        "length": length,
        "text": text,
      };
}

class Interaction {
  final String text;
  final String type;
  final int order;
  final String id;
  final String visiableIf;

  Interaction({
    required this.text,
    required this.type,
    required this.order,
    required this.id,
    required this.visiableIf,
  });

  factory Interaction.fromJson(Map<String, dynamic> json) => Interaction(
        text: json["text"],
        type: json["type"],
        order: json["order"],
        id: json["id"],
        visiableIf: json["visiableIf"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "type": type,
        "order": order,
        "id": id,
        "visiableIf": visiableIf,
      };
}
