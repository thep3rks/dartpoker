import 'cards.dart' ;

class Dealer
{
  Stack deck ;

  Dealer( )
  {
    this.deck = new Stack( 1 ) ;
  }

  shuffle( [int n = 1] )
  {
    this.deck.shuffle( n ) ;
  }

  printDeck( )
  {
    for ( int i = 0; i < deck.cards.length; i++ )
    {
      Card currentCard = deck.cards[ i ] ;

      print( currentCard.toString() ) ;
    }
  }
}