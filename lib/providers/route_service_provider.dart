part of lab;

class RouteServiceProvider implements ServiceProvider {

  load(Application app) {
    app.resolve(routes);
  }
}