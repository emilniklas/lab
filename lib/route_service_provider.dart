part of lab;

class RouteServiceProvider implements ServiceProvider {

  load(Router router) {

    router.get('/', () => view('index'));

  }
}