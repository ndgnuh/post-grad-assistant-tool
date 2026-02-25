import 'viewer_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../business/db_v2_providers.dart';
import '../../business/documents/common.dart';
import '../../business/view_models.dart';
import '../../custom_widgets.dart';
import '../../shortcuts.dart';
import 'document_pages.dart';
import 'management_providers.dart';

void _navigateToCreateDocumentPage(BuildContext context) {
  Navigator.of(context).pushNamed(DocumentCreatePage.routeName);
}

class DocumentManagementPage extends StatelessWidget {
  static const routeName = '/document/index';
  const DocumentManagementPage({super.key});

  static final tabs = [
    Tab(text: "Quy chế hiện hành"),
    Tab(text: "Tìm kiếm"),
    Tab(text: "Quản trị"),
  ];

  void onSearch(BuildContext context) {
    final tabController = DefaultTabController.of(context);
    if (tabController.index != 0) {
      tabController.animateTo(0);
    }

    FocusNodeProvider.of(context).requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: FocusNodeProvider(
        child: CommonShortcuts(
          onCreateNew: _navigateToCreateDocumentPage,
          onSearch: onSearch,
          child: Scaffold(
            appBar: ConstrainedAppBar(
              withTabBar: true,
              child: AppBar(
                title: Text('Quản lý văn bản'),
                bottom: TabBar(
                  isScrollable: true,
                  tabs: tabs,
                ),
              ),
            ),
            body: ConstrainedBody(
              child: TabBarView(
                children: [
                  _CurrentRuleTab(),
                  _DocumentSearchTab(),
                  _DocumentSettingsTab(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DocumentSettingsTab extends StatelessWidget {
  String? notEmptyValidator(String? s) {
    if (s == null || s.isEmpty) {
      return 'Vui lòng, nhập thông tin';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(context.gutter),
        child: Column(
          spacing: context.gutter,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Add section
            FramedSection(
              title: 'Thêm mới',
              padding: EdgeInsets.all(context.gutter),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Tiêu đề',
                    ),
                    validator: notEmptyValidator,
                  ),

                  SizedBox(height: context.gutter),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Số hiệu ban hành',
                    ),
                    validator: notEmptyValidator,
                  ),

                  SizedBox(height: context.gutter),

                  DateTimePicker(
                    controller: ValueNotifier<DateTime?>(null),
                    labelText: 'Ngày ban hành',
                    validator: (DateTime? dt) {
                      if (dt == null) {
                        return 'Vui lòng, chọn ngày ban hành';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: context.gutterSmall),
                  Divider(),
                  SizedBox(height: context.gutterSmall),

                  FilledButton.icon(
                    iconAlignment: IconAlignment.end,
                    icon: Icon(Symbols.save),
                    label: Text('Lưu'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Current regulation section
            FramedSection(
              title: 'Văn bản hiện hành',
              padding: EdgeInsets.all(context.gutterSmall),
              child: Column(
                children: [
                  ListTile(
                    style: ListTileStyle.drawer,
                    title: Text('Quy chế chi tiêu nội bộ'),
                    subtitle: Text('TODO'),
                    trailing: OutlinedButton(
                      child: Text('Chọn'),
                      onPressed: () {},
                    ),
                  ),
                  Divider(),
                  ListTile(
                    style: ListTileStyle.drawer,
                    title: Text('Quy chế đào tạo'),
                    subtitle: Text('TODO'),
                    trailing: OutlinedButton(
                      child: Text('Chọn'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DocumentSearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onSearchTextChanged(String text) {
      final ref = ProviderScope.containerOf(context);
      final searchController = ref.read(searchTextProvider.notifier);
      searchController.set(text);
    }

    final ref = ProviderScope.containerOf(context);
    final notifier = ref.read(searchTextProvider.notifier);

    return Padding(
      padding: EdgeInsetsGeometry.all(context.gutter),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              spacing: context.gutter,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: TextField(
                    focusNode: FocusNodeProvider.of(context),
                    controller: notifier.controller,
                    onSubmitted: onSearchTextChanged,
                    onChanged: debouncedValueChanged(
                      callback: onSearchTextChanged,
                      duration: const Duration(milliseconds: 200),
                    ),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Symbols.search),
                      labelText: 'Tìm kiếm',
                      hintText: 'Tiêu đề hoặc số hiệu',
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: () => _navigateToCreateDocumentPage(context),
                  child: Text("Thêm"),
                ),
              ],
            ),
          ),
          SizedBox(height: context.gutter),
          Expanded(
            child: FramedSection(
              title: "Kết quả tìm kiếm",
              padding: EdgeInsets.all(context.gutterSmall),
              child: _DocumentSearchResults(),
            ),
          ),
        ],
      ),
    );
  }
}

class _DocumentSearchResults extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documentsAsyncValue = ref.watch(documentsProvider);

    switch (documentsAsyncValue) {
      case AsyncLoading():
        return Center(child: CircularProgressIndicator());
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return Center(child: Text('Error: $error'));
      default:
    }

    // Handle no search input
    final documents = documentsAsyncValue.value;
    if (documents == null) {
      return Center(
        child: Text('Nhập từ khóa để tìm kiếm'),
      );
    }

    // Handle empty results
    if (documents.isEmpty) {
      return Center(
        child: Text('Không tìm thấy văn bản nào'),
      );
    }

    return ListView.separated(
      itemCount: documents.length,
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.gutterSmall),
        child: Divider(),
      ),
      itemBuilder: (context, index) {
        final document = documents[index];
        return _DocumentPreviewButton(documentId: document.id);
      },
    );
  }
}

class _DocumentPreviewButton extends ConsumerWidget {
  const _DocumentPreviewButton({
    required this.documentId,
  });

  final int documentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documentAsync = ref.watch(DocumentViewModel.provider(documentId));
    switch (documentAsync) {
      case AsyncLoading():
        return ListTile(
          title: Text('Đang tải...'),
          leading: CircularProgressIndicator(),
        );
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return ListTile(
          title: Text('Lỗi tải văn bản'),
          subtitle: Text('Error: $error'),
        );
      default:
    }

    final documentViewModel = documentAsync.value!;
    final document = documentViewModel.document;
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    return ListTile(
      title: Text(document.title),
      subtitle: Text(document.fullLabel),
      onTap: () {
        final content = documentViewModel.contentData;
        if (content == null) {
          messenger.showSnackBar(
            SnackBar(
              content: Text('Toàn văn của văn bản này không khả dụng'),
            ),
          );
          return;
        }

        // Build PDF File and open viewer
        final pdfFile = PdfFile(
          name: document.title,
          bytes: content,
        );
        navigator.push(
          MaterialPageRoute(
            builder: (context) => PdfViewerPage.fromPdfFile(pdfFile: pdfFile),
          ),
        );
      },
    );
  }
}

class _RegulationTile extends ConsumerWidget {
  final DocumentArchetype archetype;
  const _RegulationTile({required this.archetype});

  Future<List<Widget>> suggestionsBuilder(
    BuildContext context,
    SearchController controller,
  ) async {
    final navigator = Navigator.of(context);
    final ref = ProviderScope.containerOf(context);
    final db = await ref.read(mainDatabaseProvider.future);

    final createNewTile = ListTile(
      leading: Icon(Symbols.add_circle_outline),
      title: Text('Thêm mới'),
      subtitle: Text("Thêm mới ${archetype.label}"),
      onTap: () {
        _navigateToCreateDocumentPage(context);
      },
    );
    final searchText = controller.text;
    if (searchText.isEmpty) {
      return [createNewTile];
    }

    final stmt = db.searchDocuments(searchText: searchText);
    final documents = await stmt.get();
    final notifier = ref.read(regulationIdProvider(archetype).notifier);

    return [
      createNewTile,
      for (final document in documents)
        ListTile(
          title: Text(document.title),
          subtitle: Text(document.fullLabel),
          onTap: () {
            notifier.set(document.id);
            navigator.pop();
          },
        ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documentAsync = ref.watch(regulationProvider(archetype));
    switch (documentAsync) {
      case AsyncLoading():
        return ListTile(
          title: Text(archetype.label),
          subtitle: LinearProgressIndicator(),
        );
      case AsyncError(:final UserFacingException error):
        return SearchAnchor(
          suggestionsBuilder: suggestionsBuilder,
          builder: (context, controller) => ListTile(
            title: Text(archetype.label),
            subtitle: Text(error.message),
            trailing: TextButton(
              onPressed: controller.openView,
              child: Text('Chọn'),
            ),
          ),
        );
      case AsyncError(:final error, :final stackTrace):
        if (kDebugMode) {
          print(stackTrace);
        }
        return ListTile(
          title: Text(archetype.label),
          subtitle: Text('Lỗi: $error'),
        );
      default:
    }

    final document = documentAsync.value!;
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    return SearchAnchor(
      suggestionsBuilder: suggestionsBuilder,
      builder: (context, controller) => ListTile(
        title: Text(archetype.label),
        subtitle: Text([document.title, document.fullLabel].join("\n")),
        trailing: OutlinedButton(
          onPressed: controller.openView,
          child: Text('Chọn'),
        ),
        onTap: () async {
          final model = await ref.watch(
            DocumentViewModel.provider(document.id).future,
          );
          if (model.contentData == null) {
            messenger.showSnackBar(
              SnackBar(
                content: Text('Toàn văn của văn bản này không khả dụng'),
              ),
            );
            return;
          }

          final pdfFile = PdfFile(
            name: document.title,
            bytes: model.contentData!,
          );

          navigator.push(
            MaterialPageRoute(
              builder: (context) => PdfViewerPage.fromPdfFile(pdfFile: pdfFile),
            ),
          );
        },
      ),
    );
  }
}

class _CurrentRuleTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.gutter),
      child: Column(
        spacing: context.gutter,
        children: [
          FramedSection.withListTile(
            title: "Tài chính",
            children: [
              _RegulationTile(
                archetype: DocumentArchetype.internalSpendingRegulation,
              ),
              _RegulationTile(
                archetype: DocumentArchetype.financialManagementRegulation,
              ),
            ],
          ),

          FramedSection.withListTile(
            title: "Đào tạo",
            children: [
              _RegulationTile(
                archetype: DocumentArchetype.educationRegulation,
              ),
              _RegulationTile(
                archetype: DocumentArchetype.educationManagementRegulation,
              ),
              _RegulationTile(
                archetype: DocumentArchetype.studentAffairsRegulation,
              ),
            ],
          ),

          FramedSection.withListTile(
            title: 'Cán bộ',
            children: [
              _RegulationTile(
                archetype: DocumentArchetype.organizationRegulation,
              ),
              _RegulationTile(
                archetype: DocumentArchetype.staffAffairsRegulation,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
