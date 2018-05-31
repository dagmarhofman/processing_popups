dragDropType windows;

void setup()
{
  size(800, 600);
  windows = new dragDropType();
  background(0, 255, 255 );
}
void draw()
{
  for ( int i = 0; i < windows.maxItems; i++ )
    windows.win[i].drawWindow();
  
}

void mouseClicked()
{
  windows.mouseClickEvent(mouseButton);
}

void mouseMoved()
{
  windows.mouseMoveEvent();

  for ( int i=0; i< windows.maxItems; i++) {
    windows.win[i].mouseMove();
  }
}
