import 'cards.dart' ;
import 'dart:html';
import 'dart:async';

import 'package:event_stream/event_stream.dart';

//////////////////////////////////////////////
///                                        ///
/// Dealer                                 ///
///                                        ///
//////////////////////////////////////////////

class Dealer
{
  static const String RESET_GAME = "RESET_GAME" ;

  Stack deck ;

  final EventStream _onResetEvent = new EventStream();
  Stream get onReset => _onResetEvent.stream;

  //////////////////////////////////////////////
  ///                                        ///
  /// Constructor                            ///
  ///                                        ///
  //////////////////////////////////////////////

  Dealer( )
  {
    this.deck = new Stack.newDeck( 1 ) ;
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
    print( "************ RESET GAME **************" );

    // Destroy the current deck, recreate a new one, shuffle if shuffle = true
    this.deck = new Stack.newDeck( 1 ) ;

    if( shuffle ) this.shuffle( 1 ) ;

    // Notify all players to destroy any hands they may be carrying.
    this._onResetEvent.signal( ) ;
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

    this.dealer.onReset.listen( (_) => clearCards( ) ) ;
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