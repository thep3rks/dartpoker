import 'cards.dart' ;
import 'dart:html';
import 'dart:async';

//////////////////////////////////////////////
///                                        ///
/// Dealer                                 ///
///                                        ///
//////////////////////////////////////////////

class Dealer
{
  static const String RESET_GAME = "RESET_GAME" ;

  Stack deck ;
  StreamController dealerEvents ;

  Dealer( )
  {
    this.deck = new Stack.newDeck( 1 ) ;
    this.dealerEvents = new StreamController( );
  }

  shuffle( [int n = 1] )
  {
    this.deck.shuffle( n ) ;
  }

  Card deal( )
  {
    return this.deck.deal( ) ;
  }

  resetGame( bool shuffle )
  {
    // Destroy the current deck, recreate a new one, shuffle if shuffle = true

    // Notify all players to destroy any hands they may be carrying.
    dealerEvents.add( new CustomEvent( RESET_GAME ) ) ;
  }

  printDeck( )
  {
    print( "*********DEALERS DECK: Length ${deck.cards.length}*********" ) ;

    for ( int i = 0; i < deck.cards.length; i++ )
    {
      Card currentCard = deck.cards[ i ] ;

      print( currentCard.toString() ) ;
    }
  }
}

//////////////////////////////////////////////
///                                        ///
/// Player                                 ///
///                                        ///
//////////////////////////////////////////////

class Player
{
  Stack hand;
  Dealer dealer;

  // Pass in reference to dealer so we can listen for dealer events where necessary
  Player( Dealer dealer )
  {
    this.hand = new Stack( ) ;
    this.dealer = dealer ;
    // this.dealer.dealerEvents.stream.every(test)
    //any( Dealer.RESET_GAME ) => clearCards( ) ;
  }

  addCard( Card card )
  {
    this.hand.addCard( card ) ;
  }

  clearCards( )
  {
    for ( int i = 0; i < hand.cards.length; i++ )
    {
      hand.cards[ i ] = null ;
    }

    this.hand = new Stack( ) ;
  }

  printHand( )
  {
    print( "*********HAND Length ${hand.cards.length}*********" ) ;

    for ( int i = 0; i < hand.cards.length; i++ )
    {
      Card currentCard = hand.cards[ i ] ;

      print( currentCard.toString() ) ;
    }
  }
}