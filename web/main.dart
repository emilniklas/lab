import 'package:bridge/tether_client.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:async';

main() async {
  await globalTether();

  Zone zone = await initPolymer();

  zone.run(() async {

//    document.body.append(new Text(await tether.send('append')));
  });
}

@CustomTag('app-main')
class MainComponent extends PolymerElement {

  @observable String title;

  MainComponent.created() : super.created();

  attached() async {
    title = await tether.send('append');
  }
}