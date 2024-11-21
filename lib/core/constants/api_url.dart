class ApiUrl {
  final int? id;
  final String? category;
  final String? videoName;

  ApiUrl({this.id, this.category, this.videoName});

  static const String baseUrl = 'http://192.168.1.181:3000/api/';
  static const String signIn = 'login';
  static const String publishedNews = 'posts/published';
  static String newsById(String id) => 'posts/$id';
  static const String allMembers = 'members';
  static String memberById(int id) => 'members/$id';
  static const String allUsers = 'users';
  static String userById(int id) => 'users/$id';
  static const String getListOfVideosCategories = 'videos/categories';
  static String getListOfVideosInACategory(String category) =>
      'videos/categories/$category';
  static String getAVideo(String category, String videoName) =>
      '${getListOfVideosInACategory(category)}/$videoName';

  static const token = '';
}
