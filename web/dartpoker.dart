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
DivElement controlsPanel ;
ButtonElement dealCardsBtn ;
ButtonElement resetGameBtn ;
ButtonElement checkHeldBtn ;

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
  gameBoard = query('#game_board') ;
  controlsPanel = query('#controls_panel') ;

  // Creare Model classes
  d = new Dealer( ) ;
  Player p1 = d.createPlayer( ) ;

  // Create Views
  d.shuffle( ) ;
  d.onDealComplete.listen( ( e ) => createView( p1 ) ) ;

  ///d.dealToAllPlayers( 5 ) ;

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

  checkHeldBtn = new ButtonElement( ) ;
  checkHeldBtn.text = "Check Held";
  checkHeldBtn.onClick.listen( ( e ) => checkHeld( d.players[ 0 ] ) );

  controlsPanel.children.add( dealCardsBtn ) ;
  controlsPanel.children.add( resetGameBtn ) ;
  controlsPanel.children.add( checkHeldBtn ) ;
}

clearCards( )
{
  cardTable.children.clear( ) ;

  d.resetGame( true ) ;
}

checkHeld( Player p )
{
  for( CardVO c in p.hand.cards )
  {
    print("${c.toString()}, ${c.cardView.isSelected}");
  }
}

createView( Player p )
{
  var cv = cardTable.children ;
  cv.clear( ) ;

  for( CardVO c in p.hand.cards )
  {
    CardViewItem cvi = new CardViewItem( c ) ;
    c.addView( cvi ) ;
    cv.add( cvi.cardElement ) ;
  }
}
