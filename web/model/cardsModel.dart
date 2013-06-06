library playin ;

import 'dart:math' as math;

//////////////////////////////////////////////
///                                        ///
/// Card                                   ///
///                                        ///
//////////////////////////////////////////////

class Card
{
  String suit ;
  String rank ;

  Card( this.suit, this.rank )
  {
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
  static List ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"] ;
  static List suits = ["C", "D", "H", "S"] ;

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
          this.cards.add( new Card( suits[j], ranks[k] ) ) ;
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
    Card card ;

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