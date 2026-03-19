import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../../business/db_v2_providers.dart';
import '../../../business/documents.dart';
import '../../msc_admission/data/dao.dart';
import '../../msc_admission/domain/download_logic.dart';

final _downloadMutation = Mutation<PdfFile>();
final _downloadAllMutation = Mutation<List<PdfFile>>();

final _candidateProviders = StreamProvider((ref) async* {
  final db = await ref.watch(mainDatabaseProvider.future);
  yield* db.watchInterviewCandidates();
});

class AdmissionProfileDownloadingScreen extends StatelessWidget {
  const AdmissionProfileDownloadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tải hồ sơ"),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          context.gutter,
        ),
        child: Column(
          spacing: context.gutter,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DownloadAllButton(),
            Expanded(
              child: _CandidateListView(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CandidateListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_candidateProviders);
    switch (state) {
      case AsyncLoading():
        return LinearProgressIndicator();
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return Center(
          child: Text(error.toString()),
        );
      case AsyncData(value: final candidateList):
        return ListView.separated(
          itemBuilder: (context, i) {
            final candidate = candidateList[i];
            return ListTile(
              title: Text(candidate.name),
              subtitle: Text(candidate.admissionId ?? "Unknown admission ID"),
              trailing: _CandidateDownloadButton(candidate: candidate),
            );
          },
          separatorBuilder: (context, i) => Divider(),
          itemCount: candidateList.length,
        );
    }
  }
}

Future<PdfFile> _handleDownload(
  MutationTransaction tsx,
  StudentData candidate,
) async {
  final file = await downloadAdmissionProfile(
    admissionId: candidate.admissionId!,
    candidateName: candidate.name,
  );
  return file;
}

class _DownloadAllButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_candidateProviders);
    switch (state) {
      // Loading candidates
      case AsyncLoading():
        return LinearProgressIndicator();

      // Errors
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return Center(
          child: Text(error.toString()),
        );

      /// Fetch OK
      case AsyncData(value: final candidateList):

        /// Download function
        downloadAll() async {
          return await _downloadAllMutation.run(ref, (tsx) async {
            final futureFiles = <Future<PdfFile>>[];
            for (final candidate in candidateList) {
              // Pass 'tsx' into the nested mutation, NOT 'ref'
              final future = _downloadMutation(candidate.id).run(ref, (
                innerTsx,
              ) {
                return _handleDownload(innerTsx, candidate);
              });
              futureFiles.add(future);
            }

            return Future.wait(futureFiles);
          });
        }

        /// Save function
        save(List<PdfFile> pdfFileList) async {
          // Ask directory
          final saveDir = await FilePicker.platform.getDirectoryPath();
          if (saveDir == null) return;

          // Save
          for (final namedFile in pdfFileList) {
            final savePath = p.join(saveDir, namedFile.fileName);
            await File(savePath).writeAsBytes(namedFile.bytes);
          }
        }

        /// Download State
        final mutationState = ref.watch(_downloadAllMutation);
        switch (mutationState) {
          /// Fresh
          case MutationIdle():
            return FilledButton(
              onPressed: downloadAll,
              child: Text("Tải tất cả"),
            );

          /// download error
          case MutationError(:final error, :final stackTrace):
            if (kDebugMode) {
              print(stackTrace);
            }
            return FilledButton.tonalIcon(
              onPressed: downloadAll,
              icon: Icon(Symbols.error),
              label: Text("Lỗi ($error)"),
            );

          /// downloading
          case MutationPending():
            return FilledButton.icon(
              onPressed: null,
              icon: CircularProgressIndicator(),
              label: Text("Đang tải"),
            );

          /// Done
          case MutationSuccess(value: final pdfFileList):
            return FilledButton(
              onPressed: () => save(pdfFileList),
              child: Text("Lưu"),
            );
        }
    }
  }
}

class _CandidateDownloadButton extends ConsumerWidget {
  final StudentData candidate;

  const _CandidateDownloadButton({required this.candidate});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mut = _downloadMutation(candidate.id);
    final state = ref.watch(mut);

    onPressed() {
      mut.run(ref, (tsx) => _handleDownload(tsx, candidate));
    }

    return switch (state) {
      MutationIdle() => OutlinedButton(
        onPressed: onPressed,
        child: Text("Tải"),
      ),
      MutationPending() => CircularProgressIndicator(),
      MutationError() => OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorScheme.of(context).error,
        ),
        icon: Icon(Symbols.error),
        label: Text("Lỗi, thử lại"),
      ),
      MutationSuccess(value: final file) => OutlinedButton(
        onPressed: () async {
          FilePicker.platform.saveFile(
            fileName: file.fileName,
            dialogTitle: file.name,
            lockParentWindow: true,
            bytes: file.bytes,
          );
        },
        child: Text("Lưu"),
      ),
    };
  }
}
