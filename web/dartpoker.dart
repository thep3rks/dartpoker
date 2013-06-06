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
  Player p1 = new Player( d ) ;
  Player p2 = new Player( d ) ;

  d.printDeck( ) ;

  d.shuffle( ) ;

  d.printDeck( ) ;

  p1.addCard( d.deal( ) ) ;
  p1.addCard( d.deal( ) ) ;
  p1.addCard( d.deal( ) ) ;
  p1.addCard( d.deal( ) ) ;
  p1.addCard( d.deal( ) ) ;

  p2.addCard( d.deal( ) ) ;
  p2.addCard( d.deal( ) ) ;
  p2.addCard( d.deal( ) ) ;
  p2.addCard( d.deal( ) ) ;
  p2.addCard( d.deal( ) ) ;

  p1.printHand( ) ;
  p2.printHand( ) ;
  d.printDeck( ) ;

  d.resetGame( true ) ;

  p1.printHand( ) ;
  p2.printHand( ) ;

  d.printDeck( ) ;
}
