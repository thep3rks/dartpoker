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
