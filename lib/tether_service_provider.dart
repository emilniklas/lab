part of lab;

class TetherServiceProvider implements ServiceProvider {

  load(TetherManager manager) {
    manager.registerHandler((Tether tether) {

      tether.listen('append', (_) {
        return 'Hello world!';
      });

    });
  }
}