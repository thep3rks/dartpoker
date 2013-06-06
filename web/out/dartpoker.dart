// Auto-generated from dartpoker.html.
// DO NOT EDIT.

library dartpoker_html;

import 'dart:html' as autogenerated;
import 'dart:svg' as autogenerated_svg;
import 'package:web_ui/web_ui.dart' as autogenerated;
import 'package:web_ui/observe/observable.dart' as __observe;
import 'dart:html';
import '../model/actors.dart';
import '../model/cards.dart';
import 'package:web_ui/web_ui.dart';


// Original code


/**
 * Learn about the Web UI package by visiting
 * http://www.dartlang.org/articles/dart-web-components/.
 */
void main()
{
  // Enable this to use Shadow DOM in the browser.
  //useShadowDom = true;
  Dealer d = new Dealer( ) ;
  Player p1 = d.createAndAddPlayer() ;
  Player p2 = d.createAndAddPlayer() ;

  d.printDeck( ) ;

  d.shuffle( ) ;

  d.printDeck( ) ;

  d.dealToAllPlayers( 10 ) ;

  p1.printHand( ) ;
  p2.printHand( ) ;
  d.printDeck( ) ;

  d.resetGame( true ) ;

  p1.printHand( ) ;
  p2.printHand( ) ;

  d.printDeck( ) ;
}

// Additional generated code
void init_autogenerated() {
  var __root = autogenerated.document.body;
  var __t = new autogenerated.Template(__root);
  __t.create();
  __t.insert();
}

//@ sourceMappingURL=dartpoker.dart.map