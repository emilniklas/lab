part of lab;

routes(Router router, PagesController controller) {

  router.get('/', controller.index);

  router.notFoundHandler = controller.index;
}