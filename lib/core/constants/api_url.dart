class ApiUrl {
  final int? id;
  final String? category;
  final String? videoName;

  ApiUrl({this.id, this.category, this.videoName});

  static const String baseUrl = 'https://srv587771.hstgr.cloud/api/';
  //static const String baseUrl = 'http://10.0.2.2:3000/api/';
  static const String signIn = 'login';
  static const String publishedNews = 'posts/published';
  static String newsById(int id) => 'posts/$id';
  static const String allMembers = 'members';
  static String memberById(int id) => 'members/$id';
  static const String allUsers = 'users';
  static String userById(int id) => 'users/$id';
  static const String allVideos = 'videos';
  static const String recordVideo = 'videos/record-video';
  static const String getListOfCategories = 'videos/categories';
  static String getListOfVideosInACategory(int categoryId) =>
      'videos/categories/$categoryId';
  static String getAVideo(int categoryId, String videoName) =>
      '${getListOfVideosInACategory(categoryId)}/$videoName';
  static String getVideosDetails(int videoId) =>
      'videos/get-videos-details/$videoId';
  static String getStreamingVideo(int videoId) => 'videos/watch-video/$videoId';
  static String fetchHistoricById(int id) => 'videos/fetch-historic/$id';
  static const String token = '';
}
