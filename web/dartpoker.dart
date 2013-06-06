import 'dart:html';
import 'model/actors.dart';
import 'model/cardsModel.dart';
import 'view/cardViewItem.dart';
import 'package:web_ui/web_ui.dart';

/**
 * Learn about the Web UI package by visiting
 * http://www.dartlang.org/articles/dart-web-components/.
 */

UListElement cardTable ;

void main()
{
  // Enable this to use Shadow DOM in the browser.
  //useShadowDom = true;

  init( ) ;
}

init( )
{
  cardTable = query('#card_table') ;

  // Creare Model classes
  Dealer d = new Dealer( ) ;
  Player p1 = d.createPlayer( ) ;

  // Create Views

  d.shuffle( ) ;

  d.onDealComplete.listen( (_) => createView( p1 ) ) ;

  d.dealToAllPlayers( 5 ) ;

  p1.printHand( ) ;
}

createView( Player p )
{
  for( CardVO c in p.hand.cards )
  {
//    var cardElement = new LIElement( ) ;
//        cardElement.text = c.toString( ) ;
    
      CardViewItem cvi = new CardViewItem( c ) ;
      LIElement cardElement = cvi.cardElement ;
      
    cardTable.children.add( cardElement ) ;
  }
}
