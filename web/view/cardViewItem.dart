library cardViews;

import '../model/cardsModel.dart' ;
import 'dart:html';

class CardViewItem
{
  /*
  <[a|label|abbr|div|span] class="card rank-a clubs" [href=""] [title=""]>
    <span class="rank">A</span>
    <span class="suit">&clubs;</span>
    [<input type="checkbox" [...] />] <!-- if in label -->
  </[a|label|abbr|div|span]>
  */

  LIElement cardElement ;

  CardViewItem( CardVO c )
  {
     this.cardElement = new LIElement() ;

     DivElement de = new DivElement();

     String divClass = "card rank-${c.rank} ${c.suit}" ;

     de.classes.add( divClass );

     SpanElement s1 = new SpanElement();
     s1.classes.add( "rank");
     s1.text = c.rank.toUpperCase() ;

     SpanElement s2 = new SpanElement();
     s2.classes.add( "suit" );
     s2.innerHtml = "&${c.suit};" ;

     de.children.add( s1 ) ;
     de.children.add( s2 ) ;

     this.cardElement.children.add( de ) ;
  }
}