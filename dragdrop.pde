class dragDropType
{
  final int maxItems = 9;
  windowType[] win;
  boolean popUp = false;
  String[] items;
  float itemSize = 12;
  int tagged = -1;
  float tagX=0;
  float tagY=0;

  dragDropType() {
    win = new windowType[maxItems];
    items = new String[maxItems];
    for ( int i = 0; i< maxItems; i++ ) {
      items[i] = "Window " + i;
      win[i] = new windowType(items[i] ); 
    }
  }
  void closeAll() {
    background(0, 255, 255);
    popUp = false;
    for ( int i = 0; i< maxItems; i++ ) {
       win[i].drawWindow();
    }    
  }


  void doPopup() {
    int count =0;
    if ( !popUp ) { 
      color(255, 255, 255);
      fill(255, 255, 255);     
      rect( mouseX, mouseY - 5, 100, maxItems * (itemSize+1) +10 );
      for ( int i =0; i < maxItems; i++ ) {
        stroke(0, 0, 0);
        fill(0, 0, 0);

        if ( i == tagged ) 
          fill(0, 0, 255);
        else
          fill(0, 0, 0);


        text(items[i], mouseX + itemSize, mouseY + ( i * (itemSize+1)) + itemSize );
      }
      tagX = mouseX;
      tagY = mouseY;
      popUp = true;
    }
  }


  void mouseClickEvent( int button ) 
  {
    if ( button == RIGHT ) {
      doPopup();
    }
    if ( button == LEFT ) {
      for ( int i = 0; i < maxItems; i++ ) {
        if ( mouseY > tagY+(itemSize*i) + (itemSize / 2)   && mouseY <  tagY+(itemSize*(i+1)) + (itemSize/2) && mouseX > tagX && mouseX < tagX + 100 ) {
          win[i].popUp();
        }
      }
      closeAll();
    }
  }
  void mouseMoveEvent() {
    if ( popUp ) {
      for ( int i = 0; i < maxItems; i++ ) {
        if ( mouseY > tagY+(itemSize*i) + (itemSize / 2)   && mouseY <  tagY+(itemSize*(i+1)) + (itemSize/2) && mouseX > tagX && mouseX < tagX + 100 ) {
          fill(0, 0, 255);
          text(items[i], tagX + itemSize, tagY + ( i * (itemSize+1)) + itemSize );
        } else {
          fill(0, 0, 0);
          text(items[i], tagX + itemSize, tagY + ( i * (itemSize+1)) + itemSize );
        }
      }
    }
  }
}
