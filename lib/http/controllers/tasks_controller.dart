import 'package:bridge/view.dart';
import 'package:bridge/database.dart';
import 'package:app/app.dart';
import 'package:bridge/http.dart';
import 'package:bridge/validation.dart';

class TasksController {
  Repository<Task> tasks;

  TasksController(Repository<Task> this.tasks);

  index() async {
    return template('tasks.index', withData: {'tasks': await tasks.all()});
  }

  create(Session session) {
    return template('tasks.create', withData: {
      'session': session
    });
  }

  store(Input input, Validator valid, Session session) async {
    try {
    await valid.validateAll(input, {
      'title': 'required',
      'completed': 'required',
    });
    } catch(e) {
      session.flash('title', input['title']);
      session.flash('completed', input['completed'] == 'on');
      return redirect(route('tasks.create'));
    }
    var task = new Task()
      ..title = input['title']
      ..completed = input['completed'] == 'on';

    await tasks.save(task);

    return redirect(route('tasks.show', {'id': task.id}));
  }

  show({String id}) async {
    Task task = await tasks.find(id);
    return template('tasks.show', withData: {'task': task});
  }

  edit({String id}) async {
    Task task = await tasks.find(id);
    return template('tasks.edit', withData: {
      'task': task,
      'wildcard': {
        'id': task.id
      },
    });
  }

  update(Input input, {String id}) async {
    Task task = await tasks.find(id);
    task.title = input['title'];
    task.completed = input['completed'] == 'on';

    await tasks.save(task);

    return redirect(route('tasks.show', {'id': task.id}));
  }

  destroy({String id}) async {
    Task task = await tasks.find(id);

    await tasks.delete(task);

    return redirect(route('tasks.index'));
  }
}

