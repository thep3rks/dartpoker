library playingCards ;

import 'dart:math' as math;
import '../view/cardViewItem.dart' ;

//////////////////////////////////////////////
///                                        ///
/// Card                                   ///
///                                        ///
//////////////////////////////////////////////

class CardVO
{
  String suit ;
  String rank ;
  CardViewItem cardView;

  CardVO( this.suit, this.rank )
  {
  }

  // TODO: This isn't right, need to figure out custom elements.
  addView( CardViewItem cvi )
  {
    this.cardView = cvi ;
  }

  String toString( )
  {
    return "${this.suit}, ${this.rank}" ;
  }
}

//////////////////////////////////////////////
///                                        ///
/// Stack                                  ///
///                                        ///
//////////////////////////////////////////////

class Stack
{
  static List ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "j", "q", "k", "a"] ;
  static List suits = ["clubs", "diams", "hearts", "spades"] ;

  List cards ;

  //////////////////////////////////////////////
  ///                                        ///
  /// Constuctors                            ///
  ///                                        ///
  //////////////////////////////////////////////

  Stack(  )
  {
    this.cards = [ ];
  }

  Stack.newDeck( int n )
  {
    this.makeDeck( n ) ;
  }

  //////////////////////////////////////////////
  ///                                        ///
  /// Public Methods                         ///
  ///                                        ///
  //////////////////////////////////////////////

  makeDeck( int totalDecks )
  {
    int i, j, k ;
    int totalCards = ranks.length * suits.length ;

    // Set array of cards.

    this.cards = [ ]  ;

    // Fill the array with 'n' packs of cards.

    for (i = 0; i < totalDecks; i++)
    {
      for (j = 0; j < suits.length; j++)
      {
        for (k = 0; k < ranks.length; k++)
        {
          this.cards.add( new CardVO( suits[j], ranks[k] ) ) ;
        }
      }
    }
  }

  shuffle( [int n = 1] )
  {
    var temp;
    var i, j, k;

    // Shuffle the stack 'n' times.
    for (i = 0; i < n; i++)
    {
      for (j = 0; j < this.cards.length; j++)
      {
        var randomRange = new math.Random( ) ;
        num r = randomRange.nextInt( this.cards.length ) ;
        int k = r.floor( ) ;

        temp = this.cards[j];
        this.cards[j] = this.cards[k];
        this.cards[k] = temp;
      }
    }
  }

  deal( )
  {
    return this.draw( 0 ) ;
  }

  draw( int n )
  {
    CardVO card ;

    if (n >= 0 && n < this.cards.length)
    {
      card = this.cards[ n ];
      this.cards.removeAt( n );
    }
    else
    {
      card = null;
    }

    return card;
  }

  addCard( card )
  {
    this.cards.add( card ) ;
  }
}