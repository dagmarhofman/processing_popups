class windowType
{
  float x;
  float y;
  float xsize;
  float ysize;
  String text;
  boolean popped = false;
  windowType( String text ) {
    this.text = text;
    xsize = 120;
    ysize = 50;
  }
  void drawWindow() {
    if ( popped ) {
      fill(255, 255, 0);
      rect( x, y - 15, xsize, 15 );
      fill(255, 255, 255);
      rect( x, y, xsize, ysize );

      fill(0, 0, 0);
      text( text, x +1, y  -1 );
    }
  }
  void drawWindow(float xx, float yy) {
    if ( popped ) {
      fill(255, 255, 0);
      rect( xx, yy - 15, xsize, 15 );
      fill(255, 255, 255);
      rect( xx, yy, xsize, ysize );

      fill(0, 0, 0);
      text( text, xx +1, yy  -1 );
    }
  }
  void popUp()
  {
    x = mouseX;
    y = mouseY;
    popped = true;
  }
  void mouseMove( ) {
    if ( mouseX > x && mouseX < x + xsize && mouseY > y && mouseY < ysize ) {
      x = mouseX;
      y = mouseY;
    }
    //background(0, 255, 255);
    drawWindow(x,y);
  }
}
