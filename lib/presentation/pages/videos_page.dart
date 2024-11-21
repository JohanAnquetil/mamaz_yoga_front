import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VideosPage extends StatelessWidget {
  const VideosPage({super.key});
  // final LoginRemoteDataSource _loginRemoteDataSource =
  //     getIt<LoginRemoteDataSource>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder<bool>(
  //     future: _loginRemoteDataSource.isAuthenticated(),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const Center(child: CircularProgressIndicator());
  //       } else if (snapshot.data == true) {
  //         return BlocProvider(
  //           create: (context) => getIt<VideoCubit>()..loadCategories(),
  //           child: Scaffold(
  //             appBar: const CustomAppBar(
  //               title: 'Catégories',
  //               leading: false,
  //             ),
  //             body: BlocBuilder<VideoCubit, VideoState>(
  //               builder: (context, state) {
  //                 if (state is VideoLoading) {
  //                   return const Center(child: CircularProgressIndicator());
  //                 } else if (state is VideoCategoriesLoaded) {
  //                   return ListView.builder(
  //                     itemCount: state.categories.length,
  //                     itemBuilder: (context, index) {
  //                       final category = state.categories[index];
  //                       return ListTile(
  //                         title: Text(
  //                             '${category.name} (${category.videoCount} vidéos)'),
  //                         onTap: () {
  //                           print(
  //                               'Navigating to VideoListRoute with category: ${category.name}');
  //                           AutoRouter.of(context).push(
  //                             VideoListRoute(categoryName: category.name),
  //                           );
  //                         },
  //                       );
  //                     },
  //                   );
  //                 } else if (state is VideoError) {
  //                   return Center(child: Text(state.message));
  //                 }
  //                 return const Center(child: Text('No categories available'));
  //               },
  //             ),
  //           ),
  //         );
  //       } else {
  //         return const LoginPage();
  //       }
  //     },
  //   );
  // }
}
