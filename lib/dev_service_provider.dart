part of lab;

class DevServiceProvider implements ServiceProvider {

  load(Program program, Config config) {
    var env = config.env('APP_ENV', 'production');
    if (env == 'production') return;

    var reloading = false;
    Directory.current.watch(recursive: true).listen((FileSystemEvent e) {
      if (reloading) return;
      print('Reloading!');
      reloading = true;
      program.reload(['open']);
    });
  }
}