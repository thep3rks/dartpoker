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
DivElement gameBoard ;
ButtonElement dealCardsBtn ;
ButtonElement resetGameBtn ;

Dealer d;

void main()
{
  // Enable this to use Shadow DOM in the browser.
  //useShadowDom = true;

  init( ) ;
}

init( )
{
  cardTable = query('#card_table') ;
  gameBoard = query( '#game_board' ) ;

  // Creare Model classes
  d = new Dealer( ) ;
  Player p1 = d.createPlayer( ) ;

  // Create Views
  d.shuffle( ) ;
  d.onDealComplete.listen( ( e ) => createView( p1 ) ) ;

  ///d.dealToAllPlayers( 5 ) ;

  p1.printHand( ) ;
  
  createButtons( ) ;
}

createButtons( )
{
  dealCardsBtn = new ButtonElement( ) ;
  dealCardsBtn.text = "Deal";
  
  //TODO: Need to either clear between deals or check for existing
  //      before rendering new state
  dealCardsBtn.onClick.listen( ( e ) => d.dealToAllPlayers( 5 ) );
  
  resetGameBtn = new ButtonElement( ) ;
  resetGameBtn.text = "Reset";
  resetGameBtn.onClick.listen( ( e ) => clearCards( ) );
  
  gameBoard.children.add( dealCardsBtn ) ;
  gameBoard.children.add( resetGameBtn ) ;
}

clearCards( )
{
  cardTable.children.clear( ) ;
  
  d.resetGame( true ) ;
}

createView( Player p )
{
  for( CardVO c in p.hand.cards )
  {
    CardViewItem cvi = new CardViewItem( c ) ;
    cardTable.children.add( cvi.cardElement ) ;
  }
}
