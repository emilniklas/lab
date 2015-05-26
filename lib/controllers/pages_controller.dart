part of lab;

class PagesController {

  index(Config config, Request request) {
    var root = (_isDartium(request)) ? 'web' : 'build/web';
    return new File('$root/index.html').readAsString();
  }

  bool _isDartium(Request request) {
    return request.headers['user-agent'].contains('(Dart)');
  }
}