part of framework;

class Routes {
  register(
      // Controllers --
      TasksController controller,
      // --
      Router router) => router
  // Routes
    ..get('/', controller.index);
}
