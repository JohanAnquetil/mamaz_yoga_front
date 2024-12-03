class ApiUrl {
  final int? id;
  final String? category;
  final String? videoName;

  ApiUrl({this.id, this.category, this.videoName});

  static const String baseUrl = 'http://localhost:3000/api/';
  static const String signIn = 'login';
  static const String publishedNews = 'posts/published';
  static String newsById(int id) => 'posts/$id';
  static const String allMembers = 'members';
  static String memberById(int id) => 'members/$id';
  static const String allUsers = 'users';
  static String userById(int id) => 'users/$id';
  static const String getListOfVideosCategories = 'videos/categories';
  static String getListOfVideosInACategory(String category) =>
      'videos/categories/$category';
  static String getAVideo(String category, String videoName) =>
      '${getListOfVideosInACategory(category)}/$videoName';

  static const String token = '';
}
