import 'dart:html' as html;

void openInWindow(String uri, String name) {
  html.window.open(uri, name);
}