part of 'package:sample_bloc_mobile/src/presentation/pages/main/home/home_page.dart';

mixin HomeMixin on State<HomePage> {

  late final ScrollController _scrollController;
  late final PageController _pageController;
  late final HomeBloc bloc = context.read<HomeBloc>();

  late final ValueNotifier<int> _bannerListener = ValueNotifier<int>(999);
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _pageController = PageController(
      initialPage: 999,
      keepPage: false,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (t) {
        _bannerListener.value = _bannerListener.value + 1;
        _pageController.animateToPage(
          _bannerListener.value,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  void listener(BuildContext context, HomeState state) {
    if (state.isScrollingTop) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      bloc.add(const HomeScroll(isScrollingTop: false));
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
