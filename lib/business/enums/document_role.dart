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
}

enum DocumentRole {
  mscAdmissionCouncilEstabilishmentDecision(
    value: "msc/admission-council-estabilishment",
    category: DocumentCategory.msc,
    name: "QĐ thành tiểu ban xét tuyển thạc sĩ",
    canExpire: false,
  ),
  mscAdmissionAcceptanceDecision(
    value: "msc/admission-acceptance",
    category: DocumentCategory.msc,
    name: "QĐ thành tiểu ban xét tuyển thạc sĩ",
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
}
