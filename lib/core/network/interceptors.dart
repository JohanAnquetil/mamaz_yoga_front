import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

/// This interceptor is used to show request and response logs
class LoggerInterceptor extends Interceptor {
  Logger logger = Logger(
      printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true));

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request ==> $requestPath'); //Error log
    logger.d('Error type: ${err.error} \n '
        'Error message: ${err.message}'); //Debug log
    if (err.response?.statusCode == 401) {
      /// TO DO CREATE A CONDITION WHEN THE TOKEN IS REVOKED
    }
    handler.next(err); //Continue with the Error
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('LoggerInterceptor - Request: ${options.method} ${options.uri}');
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method} request ==> $requestPath'); //Info log
    handler.next(options); // continue with the Request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('LoggerInterceptor - Response received: ${response.data}');
    logger.d('STATUSCODE: ${response.statusCode} \n '
        'STATUSMESSAGE: ${response.statusMessage} \n'
        'HEADERS: ${response.headers} \n'
        'Data: ${response.data}'); // Debug log
    handler.next(response); // continue with the Response
  }
}

class AuthorizationInterceptor extends Interceptor {
  final storage = const FlutterSecureStorage();
  int? id;
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Fonction pour générer les chemins exclus
    const excludedPaths = [
      '/auth/login', // Route de connexion
      '/auth/register', // Route d'inscription
      '/news', // Liste des news publiques
    ];

    // Vérifie si la requête correspond à une route publique statique
    if (excludedPaths.any((path) => options.path.startsWith(path))) {
      print('AuthorizationInterceptor - Public static route: ${options.path}');
      handler.next(options); // Continue sans ajouter le Bearer Token
      return;
    }

    // Vérifie si la route est dynamique (ex : /news/:id)
    final isDynamicNewsRoute = RegExp(r'^/news/\d+$').hasMatch(options.path);
    if (isDynamicNewsRoute) {
      print('AuthorizationInterceptor - Public dynamic route: ${options.path}');
      handler.next(options); // Continue sans ajouter le Bearer Token
      return;
    }

    // Ajout du Bearer Token pour les routes sécurisées
    try {
      final token = await storage.read(key: 'token');
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = "Bearer $token";
        print('AuthorizationInterceptor - Token added for: ${options.path}');
      } else {
        print('AuthorizationInterceptor - Token is missing');
      }
    } catch (e) {
      print('AuthorizationInterceptor - Error retrieving token: $e');
    }

    handler.next(options);
  }
}
