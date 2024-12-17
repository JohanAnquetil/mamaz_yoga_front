import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamaz_yoga/init_config.dart';
import 'package:mamaz_yoga/presentation/blocs/list_categories_videos/list_categories_videos_cubit.dart';
import 'package:mamaz_yoga/presentation/blocs/list_categories_videos/list_categories_videos_state.dart';
import 'package:mamaz_yoga/presentation/widgets/custom_app_bar.dart';

// @RoutePage()
// class VideosPage extends StatelessWidget {
//   const VideosPage({super.key});
//   // final LoginRemoteDataSource _loginRemoteDataSource =
//   //     getIt<LoginRemoteDataSource>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Categories'),
//       ),
//       body: BlocBuilder<ListCategoriesVideosCubit, ListCategoriesVideosState>(
//         builder: (context, state) {
//           print("state: $state");
//           if (state.status == ListCategoriesStatus.loading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state.status == ListCategoriesStatus.success) {
//             // return BlocProvider.value(
//             //   value: getIt<ListCategoriesVideosCubit>()
//             //     ..fetchVideosFromACategory(6),
//             //child: ListView.builder(
//             return ListView.builder(
//               itemCount: state.getListOfCategories.length,
//               itemBuilder: (context, index) {
//                 final category = state.getListOfCategories[index];
//                 //return Text("passez par ici");
//                 return ListTile(title: Text(category.category));
//               },
//               //),
//             );
//           } else {
//             return Center(child: Text(state.error.toString()));
//           }
//         },
//       ),
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return FutureBuilder<bool>(
//   //     future: _loginRemoteDataSource.isAuthenticated(),
//   //     builder: (context, snapshot) {
//   //       if (snapshot.connectionState == ConnectionState.waiting) {
//   //         return const Center(child: CircularProgressIndicator());
//   //       } else if (snapshot.data == true) {
//   //         return BlocProvider(
//   //           create: (context) => getIt<VideoCubit>()..loadCategories(),
//   //           child: Scaffold(
//   //             appBar: const CustomAppBar(
//   //               title: 'Catégories',
//   //               leading: false,
//   //             ),
//   //             body: BlocBuilder<VideoCubit, VideoState>(
//   //               builder: (context, state) {
//   //                 if (state is VideoLoading) {
//   //                   return const Center(child: CircularProgressIndicator());
//   //                 } else if (state is VideoCategoriesLoaded) {
//   //                   return ListView.builder(
//   //                     itemCount: state.categories.length,
//   //                     itemBuilder: (context, index) {
//   //                       final category = state.categories[index];
//   //                       return ListTile(
//   //                         title: Text(
//   //                             '${category.name} (${category.videoCount} vidéos)'),
//   //                         onTap: () {
//   //                           print(
//   //                               'Navigating to VideoListRoute with category: ${category.name}');
//   //                           AutoRouter.of(context).push(
//   //                             VideoListRoute(categoryName: category.name),
//   //                           );
//   //                         },
//   //                       );
//   //                     },
//   //                   );
//   //                 } else if (state is VideoError) {
//   //                   return Center(child: Text(state.message));
//   //                 }
//   //                 return const Center(child: Text('No categories available'));
//   //               },
//   //             ),
//   //           ),
//   //         );
//   //       } else {
//   //         return const LoginPage();
//   //       }
//   //     },
//   //   );
//   // }
// }

@RoutePage()
class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Appel initial pour récupérer les catégories et les vidéos
    context.read<ListCategoriesVideosCubit>().fetchListOfCategories();

    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocBuilder<ListCategoriesVideosCubit, ListCategoriesVideosState>(
        builder: (context, state) {
          if (state.status == ListCategoriesStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == ListCategoriesStatus.success) {
            return ListView.builder(
              itemCount: state.getListOfCategories.length,
              itemBuilder: (context, index) {
                final category = state.getListOfCategories[index];
                final videos = state.videosByCategory[category.id] ?? [];
                print("video in video_page: $videos");

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titre de la catégorie
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        category.category,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),

                    // Liste horizontale des vidéos (thumbnails)
                    SizedBox(
                      height: 150, // Hauteur fixe pour les thumbnails
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // Scroll horizontal
                        itemCount: videos.length,
                        itemBuilder: (context, videoIndex) {
                          final video = videos[videoIndex];

                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SizedBox(
                                width: 150, // Largeur fixe pour les thumbnails
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Image thumbnail
                                    Expanded(
                                      child: Image.network(
                                        "/usr/src/app/videos/${video.thumbnail}",
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            color: Colors.grey,
                                            child: const Icon(Icons.error),
                                          );
                                        },
                                      ),
                                    ),
                                    // Titre de la vidéo
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        video.name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(), // Séparateur entre les catégories
                  ],
                );
              },
            );
          } else {
            return Center(child: Text(state.error ?? "error"));
          }
        },
      ),
    );
  }
}
