import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../core/constants/api_url.dart';
import '../../core/network/dio_client.dart';
import '../auth/models/signin_req_params.dart';
import '../../init_config.dart';

abstract class AuthService {
  Future<Either> signin(SigninReqParams params);
  Future<Either> getUser(int id);
  Future<Either> getArticles();
  Future<Either> getArticle(int id);
  Future<Either> getListOfCategories();
  Future<Either> getVideosByCategory(int id);
  Future<Either> getVideoDetails(int id);
  Future<Either> streamVideoWithHeaders(int id);
  Future<Either> fetchAllVideos();
  Future<Either> fetchHistoricById(int id);
}

class AuthApiServiceImpl extends AuthService {
  @override
  Future<Either> signin(SigninReqParams params) async {
    try {
      var response = await getIt<DioClient>().post(
        ApiUrl.signIn,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getUser(int id) async {
    try {
      var response = await getIt<DioClient>().get(ApiUrl.userById(id));
      print("response : $response");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getArticles() async {
    try {
      var response = await getIt<DioClient>().get(ApiUrl.publishedNews);
      print("response all articles in api service : $response");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getArticle(int id) async {
    try {
      var response = await getIt<DioClient>().get(ApiUrl.newsById(id));
      print("response article in api service: $response");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getListOfCategories() async {
    try {
      print(ApiUrl.getListOfCategories);
      var response = await getIt<DioClient>().get(ApiUrl.getListOfCategories);
      print("response get list of categories in api service: $response");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getVideosByCategory(int id) async {
    try {
      var response =
          await getIt<DioClient>().get(ApiUrl.getListOfVideosInACategory(id));
      print(
          "response get videos by category in api service: ${response.data['videoDescriptions']}");
      return Right(response.data['videoDescriptions']);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getVideoDetails(int id) async {
    try {
      var response = await getIt<DioClient>().get(ApiUrl.getVideosDetails(id));
      print("response get videos details in api service: $response");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> streamVideoWithHeaders(int id) async {
    try {
      var response = await getIt<DioClient>().get(ApiUrl.getStreamingVideo(id));
      print("response streaming videos details in api service: $response");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> fetchAllVideos() async {
    try {
      var response = await getIt<DioClient>().get(ApiUrl.allVideos);
      print("response all videos in api service: ${response.data['data']}");
      return Right(response.data['data']);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> fetchHistoricById(int id) async {
    try {
      var response = await getIt<DioClient>().get(ApiUrl.fetchHistoricById(id));
      print("response fetch historic in api service: ${response.data['data']}");
      return Right(response.data['data']);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
