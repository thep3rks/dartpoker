import 'dart:html';
import 'model/actors.dart';
import 'model/cardsModel.dart';
import 'package:web_ui/web_ui.dart';

/**
 * Learn about the Web UI package by visiting
 * http://www.dartlang.org/articles/dart-web-components/.
 */
void main()
{
  // Enable this to use Shadow DOM in the browser.
  //useShadowDom = true;

  init( ) ;
}

init( )
{
  // Creare Model classes
  Dealer d = new Dealer( ) ;
  Player p1 = d.createPlayer() ;

  // Create Views


  d.shuffle( ) ;

  d.onDealComplete.listen( (_) => print("Deal Complete") ) ;

  d.dealToAllPlayers( 5 ) ;

  p1.printHand( ) ;
}
