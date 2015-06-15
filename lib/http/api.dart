import 'package:bridge/http.dart';
import 'package:bridge/tether.dart';
import 'controllers/tasks_controller.dart';
import 'package:bridge/core.dart';
import 'package:bridge/view.dart';

class Api {
  TasksController controller;

  Api(TasksController this.controller);

  routes(Router router) {
    router.get('/', () => template('index'), name: 'home');
    router.resource('tasks', controller, name: 'tasks');
  }

  tether(Tether tether, Container c) {
  }
}
