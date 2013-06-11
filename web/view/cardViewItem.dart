library cardViews;

import 'package:web_ui/web_ui.dart';
import '../model/cardsModel.dart' ;
import 'dart:html';

class CardViewItem extends WebComponent
{
  /*
  <[a|label|abbr|div|span] class="card rank-a clubs" [href=""] [title=""]>
    <span class="rank">A</span>
    <span class="suit">&clubs;</span>
    [<input type="checkbox" [...] />] <!-- if in label -->
  </[a|label|abbr|div|span]>
  */

  LIElement cardElement;
  CheckboxInputElement checkBox ;
  CardVO cardVO ;

  bool get isSelected => checkBox.checked ;

  CardViewItem( CardVO c )
  {
    this.cardVO = c ;
    this.cardElement = new LIElement();

    String divClass = "card rank-${c.rank} ${c.suit}" ;
    DivElement de = new DivElement();
    de.classes.add( divClass );

    SpanElement s1 = new SpanElement();
    s1.classes.add( "rank");
    s1.text = c.rank.toUpperCase();

    SpanElement s2 = new SpanElement();
    s2.classes.add( "suit" );
    s2.innerHtml = "&${c.suit};" ;

    DivElement cbWrapper = new DivElement();
    cbWrapper.classes.add( "card_checkbox" ) ;
    this.checkBox = new CheckboxInputElement();
    cbWrapper.children.add( checkBox );

    de.children.add( s1 ) ;
    de.children.add( s2 ) ;

    this.cardElement.children.add( de ) ;
    this.cardElement.children.add( cbWrapper ) ;
  }
}