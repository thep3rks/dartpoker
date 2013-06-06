library actors ;

import 'cardsModel.dart' ;
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
  Stack deck ;
  List players ;

  final EventStream _onDealCompleteEvent = new EventStream( );
  Stream get onDealComplete => _onDealCompleteEvent.stream;

  //////////////////////////////////////////////
  ///                                        ///
  /// Constructor                            ///
  ///                                        ///
  //////////////////////////////////////////////

  Dealer( )
  {
    this.deck = new Stack.newDeck( 1 ) ;
  }

  Player createPlayer( )
  {
    if (this.players == null ) this.players = [ ] ;

    Player p = new Player( ) ;
    this.players.add( p ) ;

    return p ;
  }

  removePlayer( Player p )
  {
    this.players.remove( p ) ;
    p.destroy( ) ;
  }

  shuffle( [int n = 1] )
  {
    this.deck.shuffle( n ) ;
  }

  dealToAllPlayers( [ int cardCount = 1 ] )
  {
    for( var i = 0; i < cardCount ; i++ )
    {
      for( Player p in this.players )
      {
        p.addCard( this.deal( ) ) ;
      }
    }

    this._onDealCompleteEvent.signal( ) ;
  }

  CardVO deal( )
  {
    return this.deck.deal( ) ;
  }

  resetGame( bool shuffle )
  {
    print( "************ RESET GAME **************" );

    // Destroy the current deck, recreate a new one, shuffle if shuffle = true
    this.deck = new Stack.newDeck( 1 ) ;

    if( shuffle ) this.shuffle( 1 ) ;

    for( Player p in this.players )
    {
      p.clearCards( true ) ;
    }
  }

  printDeck( )
  {
    print( "*********DEALERS DECK: Length ${deck.cards.length}*********" ) ;

    for ( int i = 0; i < deck.cards.length; i++ )
    {
      CardVO currentCard = deck.cards[ i ] ;

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

  Player( )
  {
    this.hand = new Stack( ) ;
  }

  addCard( CardVO card )
  {
    this.hand.addCard( card ) ;
  }

  clearCards( bool reset )
  {
    for ( int i = 0; i < hand.cards.length; i++ )
    {
      hand.cards[ i ] = null ;
    }

    if (reset) this.hand = new Stack( ) ;
  }

  destroy( )
  {
    this.clearCards( false ) ;
    this.hand = null ;
  }

  printHand( )
  {
    print( "*********HAND Length ${hand.cards.length}*********" ) ;

    for ( int i = 0; i < hand.cards.length; i++ )
    {
      CardVO currentCard = hand.cards[ i ] ;

      print( currentCard.toString() ) ;
    }
  }
}