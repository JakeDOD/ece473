#include <stdio.h>

int function(int a);

int main()
{
  int x=5;
  int y;

  y = function(x);
  
  printf("y=%i\n", y);

  return 0;
}

int function(int a)
{
  return 3*a+5;
}
