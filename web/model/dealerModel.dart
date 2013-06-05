import 'cards.dart' ;

class Dealer
{
  Stack stack ;

  Dealer( )
  {
    this.stack = new Stack( 1 ) ;

    for ( int i = 0; i < stack.cards.length; i++ )
    {
      Card currentCard = stack.cards[ i ] ;

      print( currentCard.toString() ) ;
    }
  }
}