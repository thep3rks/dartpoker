import 'dart:html';
import 'model/actors.dart';
import 'model/cards.dart';
import 'package:web_ui/web_ui.dart';

/**
 * Learn about the Web UI package by visiting
 * http://www.dartlang.org/articles/dart-web-components/.
 */
void main()
{
  // Enable this to use Shadow DOM in the browser.
  //useShadowDom = true;
  Dealer d = new Dealer( ) ;
  Player p = new Player( ) ;

  d.printDeck( ) ;

  d.shuffle( ) ;

  d.printDeck( ) ;

  p.addCard( d.deal( ) ) ;
  p.addCard( d.deal( ) ) ;
  p.addCard( d.deal( ) ) ;
  p.addCard( d.deal( ) ) ;
  p.addCard( d.deal( ) ) ;

  p.printHand( ) ;
  d.printDeck( ) ;
}
