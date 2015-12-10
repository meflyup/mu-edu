// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
library my_project.web.index;

import 'package:polymer/polymer.dart';
import 'dart:html';
/// [MainApp] used!
main() async {
  await initPolymer();
  DivElement content = querySelector("#content");
  content.onMouseUp.listen(select);


}
void login(Event e){

}
void loadData(Event e){

}
void select(Event e) {

  DivElement selContent = querySelector("#selectContent");

  var selStr = window.getSelection().getRangeAt(0).cloneContents().innerHtml;
  selContent.text = selStr.toString();
  sendData(selStr.toString());
}

void sendData(String data) {
  var webSocket = new WebSocket('ws://127.0.0.1:4040/ws');
  if (webSocket != null && webSocket.readyState == WebSocket.OPEN) {
    webSocket.send(data);
  } else {
    print('WebSocket not connected, message $data not sent');
  }
}