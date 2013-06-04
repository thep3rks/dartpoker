import 'card-vo.dart' ;

import 'dart:math' as math;

class Stack
{
  static List ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"];
  static List suits = ["C", "D", "H", "S"];

  List cards ;

  makeDeck( totalDecks )
  {
    int i, j, k ;
    int totalCards = ranks.length * suits.length ;

    // Set array of cards.

    this.cards = new List( totalDecks * totalCards ) ;

    // Fill the array with 'n' packs of cards.

    for (i = 0; i < totalDecks; i++)
    {
      for (j = 0; j < suits.length; j++)
      {
        for (k = 0; k < ranks.length; k++)
        {
          this.cards[i * totalCards + j * ranks.length + k] =

          new Card( ranks[k], suits[j] );
        }
      }
    }
  }

  shuffle( n )
  {
    var temp;
    var i, j, k;

    // Shuffle the stack 'n' times.
    for (i = 0; i < n; i++)
    {
      for (j = 0; j < this.cards.length; j++)
      {
        var randomRange = new math.Random( this.cards.length ) ;
        int k = randomRange.floor;

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

  draw( n )
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