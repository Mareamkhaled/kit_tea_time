import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../core/widgets/custom_box_shadow.dart';
import '../cubit/gallery_cubit.dart';
import '../widgets/cat_card.dart';
import '../widgets/gallery_shimmer.dart';

class GalleryScreen extends HookWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final showLoadMoreButton = useState(false);

    useEffect(() {
      void onScroll() {
        final cubit = context.read<GalleryCubit>();
        final state = cubit.state;

        if (state is GalleryLoaded) {
          if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100) {
            if (!state.hasReachedEnd) {
              showLoadMoreButton.value = true;
            }
          } else {
            showLoadMoreButton.value = false;
          }
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, []);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gallery', style: AppStyle.lemon500Style20),
                      const Gap(4),
                      BlocBuilder<GalleryCubit, GalleryState>(
                        builder: (context, state) {
                          final count = state is GalleryLoaded
                              ? state.galleries.length
                              : 0;
                          return Text(
                            '$count adorable cats',
                            style: AppStyle.lemon300Style12Grey,
                          );
                        },
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      showLoadMoreButton.value = false;
                      context.read<GalleryCubit>().fetchGalleryImages();
                    },
                  ),
                ],
              ),
              const Gap(16),

              Expanded(
                child: BlocBuilder<GalleryCubit, GalleryState>(
                  builder: (context, state) {
                    if (state is GalleryLoading) {
                      return const GalleryShimmer();
                    } else if (state is GalleryLoaded) {
                      return Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              controller: scrollController,
                              itemCount: state.galleries.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 16,
                                    crossAxisSpacing: 16,
                                    childAspectRatio: 1,
                                  ),
                              padding: const EdgeInsets.all(16),
                              itemBuilder: (context, index) {
                                final cat = state.galleries[index];
                                return CatCard(
                                  imageUrl: cat.url,
                                  onFavoritePressed: () {},
                                );
                              },
                            ),
                          ),
                          // Load More Section - only show based on scroll position
                          if (state.isLoadingMore)
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            )
                          else if (showLoadMoreButton.value &&
                              !state.hasReachedEnd)
                            GestureDetector(
                              onTap: () {
                                showLoadMoreButton.value = false;
                                context.read<GalleryCubit>().fetchGalleryImages(
                                  isLoadMore: true,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.myWhite,
                                  boxShadow: [customBoxShadow()],
                                ),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    'Load More',
                                    style: AppStyle.lemon300Style12Grey
                                        .copyWith(
                                          color: AppColors.primaryColor,
                                        ),
                                  ),
                                ),
                              ),
                            )
                          else if (state.hasReachedEnd &&
                              showLoadMoreButton.value)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                'No more cats to load',
                                style: AppStyle.lemon300Style12Grey,
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ],
                      );
                    } else if (state is GalleryFailed) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Failed to load gallery',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(8),
                            Text(
                              state.errorMessage,
                              style: const TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                            const Gap(16),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<GalleryCubit>()
                                    .fetchGalleryImages();
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
