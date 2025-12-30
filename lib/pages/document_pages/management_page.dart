import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../custom_widgets.dart';
import '../../shortcuts.dart';
import 'management_providers.dart';

class DocumentManagementPage extends StatelessWidget {
  static const routeName = '/document/index';
  const DocumentManagementPage({super.key});

  static final tabs = [
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
          TextField(
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
          SizedBox(height: context.gutter),
          Expanded(
            child: FramedSection(
              title: "Kết quả tìm kiếm",
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
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final document = documents[index];
        return ListTile(
          title: Text(document.title),
          subtitle: Text("${document.officialCode}/${document.officialType}"),
        );
      },
    );
  }
}
