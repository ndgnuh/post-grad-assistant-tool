String formatMoney(int money) {
  if (money < 0) {
    return "Số tiền không hợp lệ";
  }

  // Thêm dấu chấm vào các nhóm ba chữ số
  return money.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (Match m) => "${m[1]}.",
      );
}

String money_as_text(int money) {
  if (money < 0) {
    return "Số tiền không hợp lệ";
  }

  final units = [
    "đồng",
    "nghìn",
    "triệu",
    "tỷ",
    "nghìn tỷ",
    "triệu tỷ",
  ];
  final parts = <String>[];
  int unitIndex = 0;
  while (money > 0) {
    final part = money % 1000;
    if (part > 0) {
      parts.add(
          "${part.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")} ${units[unitIndex]}");
    }
    money ~/= 1000;
    unitIndex++;
  }

  return parts.reversed.join(" ");
}
