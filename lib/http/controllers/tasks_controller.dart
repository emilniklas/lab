part of controllers;

class TasksController {
  index(Repository<Task> repo) async {

    await repo.save(new Task()
    ..title = 'TITLEZZ'
    ..completed = true);

    return template('index', withData: {
      'tasks': await repo.all()
    });
  }
}
