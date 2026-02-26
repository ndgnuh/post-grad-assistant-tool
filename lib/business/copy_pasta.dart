import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../core/router.dart';

void copyToClipboard({
  required String text,
  required String notification,
  BuildContext? context,
}) {
  context = context ?? navigationKey.currentContext;
  Clipboard.setData(ClipboardData(text: text));
  final messenger = ScaffoldMessenger.of(context!);
  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(SnackBar(content: Text(notification)));
}

Uri createMailtoLink(Email email) {
  final recipients = email.recipients.join(',');
  final queries = {
    if (email.ccRecipients.isNotEmpty) "cc": email.ccRecipients.join(','),
    if (email.bccRecipients.isNotEmpty) "bcc": email.bccRecipients.join(','),
    if (email.subject.isNotEmpty) "subject": (email.subject),
    if (email.body.isNotEmpty) "body": (email.body),
  };

  final queryString = queries.entries
      .map(
        (entry) =>
            "${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}",
      )
      .join('&');

  return Uri(
    scheme: "mailto",
    path: recipients,
    query: queryString,
  );
}

/// Quotes a string for pasting in Excel, escaping double quotes
String quoteExcelString(String value) {
  value = value.replaceAll('"', '\\"');
  return "\"$value\"";
}

/// Sanitizes a string to paste into Excel
String sanitizeExcelString(String? value) {
  if (value == null || value.isEmpty) return "";

  if (value.contains('\n')) {
    var parts = value.split('\n');
    parts = [for (final part in parts) quoteExcelString(part)];

    return "=CONCAT(${parts.join(', CHAR(10), ')})";
  }

  return "=${quoteExcelString(value)}";
}

// void copyNhacNhoNopDiem({required BuildContext context, required HocKy hocKy}) {
//   final tenDotHoc = hocKy.hocKy;
//   final ngayKetThucHoc = toDmy(hocKy.ketThucHoc);
//
//   final text =
//       """
// [Thông báo] Nộp điểm cao học đợt học $tenDotHoc
//
// Kính gửi các Thầy, các Cô,
//
// Ngày $ngayKetThucHoc là ngày kết thúc của đợt học $tenDotHoc.
// Thầy, Cô tổ chức cho học viên thi và gửi hai bảng điểm cho em trước ngày $ngayKetThucHoc ạ.
//
// Khi cho học viên thi, Thầy, Cô điền luôn ngày thi trên bảng điểm giúp em ạ.
//
// Em cảm ơn Thầy, Cô ạ.""";
//
//   copyToClipboard(text: text, notification: "Đã sao chép nhắc nộp điểm.");
// }

/// Converts a list of lists of strings to a tab-separated string for pasting into Excel
String toExcelPastable(List<List<String>> data) {
  final rows = data
      .map((row) {
        return row.map((cell) => sanitizeExcelString(cell)).join('\t');
      })
      .join('\n');
  return rows;
}

@immutable
class Email {
  final String subject;
  final String body;
  final Set<String> recipients;
  final Set<String> ccRecipients;
  final Set<String> bccRecipients;

  const Email({
    this.subject = "",
    this.body = "",
    this.recipients = const {},
    this.ccRecipients = const {},
    this.bccRecipients = const {},
  });

  Uri get mailtoLink => createMailtoLink(this);

  void copyBccRecipients() =>
      Clipboard.setData(ClipboardData(text: bccRecipients.join(' ')));

  void copyBody() => Clipboard.setData(ClipboardData(text: body));

  void copyCcRecipients() =>
      Clipboard.setData(ClipboardData(text: ccRecipients.join(' ')));

  void copyRecipients() =>
      Clipboard.setData(ClipboardData(text: recipients.join(' ')));

  void copySubject() => Clipboard.setData(ClipboardData(text: subject));
}

class EmailCopyDialog extends StatelessWidget {
  final Email email;

  const EmailCopyDialog({super.key, required this.email});

  EmailCopyDialog.fromTemplate({
    super.key,
    String subject = "",
    String body = "",
    Set<String> recipients = const {},
    Set<String> ccRecipients = const {},
    Set<String> bccRecipients = const {},
  }) : email = Email(
         subject: subject,
         body: body,
         recipients: recipients,
         ccRecipients: ccRecipients,
         bccRecipients: bccRecipients,
       );

  @override
  Widget build(BuildContext context) {
    final mailToLink = email.mailtoLink;

    final copyDelim = '\n';
    return SimpleDialog(
      title: Row(
        children: [
          Expanded(child: Text("Click để copy")),
          CloseButton(),
        ],
      ),
      children: [
        ListTile(
          title: Text("Người nhận"),
          subtitle: Text(email.recipients.join('\n')),
          trailing: Icon(Icons.copy),
          onTap: () => copyToClipboard(
            context: context,
            text: email.recipients.join(copyDelim),
            notification: "Đã sao chép người nhận email.",
          ),
        ),
        if (email.ccRecipients.isNotEmpty)
          ListTile(
            title: Text("CC"),
            subtitle: Text(email.ccRecipients.join('\n')),
            trailing: Icon(Icons.copy),
            onTap: () => copyToClipboard(
              context: context,
              text: email.ccRecipients.join(copyDelim),
              notification: "Đã sao chép người nhận CC email.",
            ),
          ),
        if (email.bccRecipients.isNotEmpty)
          ListTile(
            title: Text("BCC"),
            subtitle: Text(email.bccRecipients.join('\n')),
            trailing: Icon(Icons.copy),
            onTap: () => copyToClipboard(
              context: context,
              text: email.bccRecipients.join(copyDelim),
              notification: "Đã sao chép người nhận BCC email.",
            ),
          ),
        ListTile(
          title: Text("Tiêu đề"),
          subtitle: Text(email.subject),
          trailing: Icon(Icons.copy),
          onTap: () => copyToClipboard(
            context: context,
            text: email.subject,
            notification: "Đã sao chép tiêu đề email.",
          ),
        ),
        ListTile(
          title: Text("Nội dung"),
          trailing: Icon(Icons.copy),
          subtitle: Text(email.body),
          onTap: () => copyToClipboard(
            text: email.body,
            context: context,
            notification: "Đã sao chép nội dung email.",
          ),
        ),
        ListTile(
          title: Text("Gửi (mailto)"),
          trailing: Icon(Symbols.send),
          subtitle: Text("Mở trong ứng dụng email"),
          onTap: () => url_launcher.launchUrl(mailToLink),
        ),
      ],
    );
  }
}
