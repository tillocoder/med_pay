part of 'package:sample_bloc_mobile/src/presentation/pages/main/entries/entries_page.dart';

mixin EntriesMixin on State<MyOrderPage> {
  late final TabController _tabController;
  late final ScrollController _scrollController = ScrollController();

  void initController(TickerProvider vsync) {
    _tabController = TabController(length: 2, vsync: vsync);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
