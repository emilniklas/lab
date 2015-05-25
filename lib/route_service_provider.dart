part of lab;

class RouteServiceProvider implements ServiceProvider {

  load(Router router) {

    var spaHandler = () => view('index');

    router.get('/', spaHandler);

    router.notFoundHandler = spaHandler;
  }
}