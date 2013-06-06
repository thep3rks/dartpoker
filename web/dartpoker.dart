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
  Player p1 = d.createPlayer() ;
  Player p2 = d.createPlayer() ;
  Player p3 = d.createPlayer() ;
  Player p4 = d.createPlayer() ;
  Player p5 = d.createPlayer() ;

  d.printDeck( ) ;

  d.shuffle( ) ;

  d.printDeck( ) ;

  d.dealToAllPlayers( 3 ) ;

  p1.printHand( ) ;
  p2.printHand( ) ;
  p3.printHand( ) ;
  p4.printHand( ) ;
  p5.printHand( ) ;

  d.printDeck( ) ;

  d.resetGame( true ) ;

  d.printDeck( ) ;

  d.removePlayer( p2 ) ;
  p2 = null ;
  d.removePlayer( p4 ) ;
  p4 = null ;

  d.dealToAllPlayers( 4 ) ;

  p1.printHand( ) ;
  p3.printHand( ) ;
  p5.printHand( ) ;

  d.printDeck( ) ;
}
