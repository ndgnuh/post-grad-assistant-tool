enum DocumentCategory {
  common(
    value: "common",
    label: "Văn bản chung",
  ),
  msc(
    value: "msc",
    label: "Thạc sĩ, học viên cao học",
  ),
  phd(
    value: "phd",
    label: "Nghiên cứu sinh",
  );

  final String value;
  final String label;
  const DocumentCategory({
    required this.value,
    required this.label,
  });

  String toValue() => value;
  static DocumentCategory fromValue(String value) {
    return DocumentCategory.values.firstWhere(
      (category) => category.value == value,
    );
  }
}

enum DocumentRole {
  // Tuyển sinh thạc sĩ
  mscAdmissionCouncilEstabilishmentDecision(
    value: "admission-council-estabilishment",
    category: DocumentCategory.msc,
    name: "QĐ thành tiểu ban xét tuyển thạc sĩ",
    canExpire: false,
  ),
  mscAdmissionAcceptanceDecision(
    value: "admission-acceptance",
    category: DocumentCategory.msc,
    name: "QĐ thành tiểu ban xét tuyển thạc sĩ",
    canExpire: false,
  ),

  // Luận văn
  mscThesisAssignmentDecision(
    value: "thesis-assignment",
    category: DocumentCategory.msc,
    name: "QĐ phân công luận văn thạc sĩ",
    canExpire: false,
  ),
  mscThesisExtensionDecision(
    value: "thesis-extension",
    category: DocumentCategory.msc,
    name: "Quyết định gia hạn thời gian làm luận văn thạc sĩ",
    canExpire: false,
  ),
  mscThesisDefenseDecision(
    value: "thesis-defense",
    category: DocumentCategory.msc,
    name: "QĐ thành lập hội đồng bảo vệ luận văn thạc sĩ",
    canExpire: false,
  );

  final String value;
  final DocumentCategory category;
  final String name;
  final bool canExpire;
  const DocumentRole({
    required this.value,
    required this.category,
    required this.name,
    required this.canExpire,
  });

  static DocumentRole fromValue(String value) {
    final catValue = value.split('/').first;
    final docValue = value.split('/').last;
    final category = DocumentCategory.fromValue(catValue);
    return DocumentRole.values.firstWhere(
      (role) => role.value == docValue && role.category == category,
    );
  }

  String toValue() => "${category.value}/$value";
}
