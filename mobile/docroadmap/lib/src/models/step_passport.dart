class StepInfo {
  String title;
  String doc;
  String stepToFollow;
  bool isValidate;
  DateTime meetDate;
  DateTime validateDate;
  int procedureId;

  StepInfo({
    required this.title,
    required this.doc,
    required this.stepToFollow,
    required this.isValidate,
    required this.meetDate,
    required this.validateDate,
    required this.procedureId,
  });

  factory StepInfo.fromJson(Map<String, dynamic> json) {
    return StepInfo(
      title: json['title'] ?? '',
      doc: json['doc'] ?? '',
      stepToFollow: json['stepToFollow'] ?? '',
      isValidate: json['isValidate'] ?? false,
      meetDate:
          DateTime.parse(json['meetDate'] ?? DateTime.now().toIso8601String()),
      validateDate: DateTime.parse(
          json['validateDate'] ?? DateTime.now().toIso8601String()),
      procedureId: json['procedureId'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'doc': doc,
      'stepToFollow': stepToFollow,
      'isValidate': isValidate,
      'meetDate': meetDate.toIso8601String(),
      'validateDate': validateDate.toIso8601String(),
      'procedureId': procedureId,
    };
  }
}

class ProcedureInfo {
  String title;
  String description;
  List<StepInfo> steps;

  ProcedureInfo({
    required this.title,
    required this.description,
    required this.steps,
  });

  factory ProcedureInfo.fromJson(Map<String, dynamic> json) {
    var stepsList = json['steps'] as List? ?? [];
    List<StepInfo> steps = stepsList.map((i) => StepInfo.fromJson(i)).toList();

    return ProcedureInfo(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      steps: steps,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'steps': steps.map((step) => step.toJson()).toList(),
    };
  }
}
