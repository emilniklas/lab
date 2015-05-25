import 'dart:io';

main() async {
  var server = await HttpServer.bind('localhost', 1337);
  await for(HttpRequest request in server) {
    request.response.write('Hello Worlds!');
    request.response.close();
  }
}