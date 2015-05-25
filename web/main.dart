import 'package:bridge/tether_client.dart';
import 'dart:html';

main() async {
  await globalTether();

  document.body.append(new Text(await tether.send('append')));
}