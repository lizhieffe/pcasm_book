#include <stdio.h>

// prototype for assembly routine
void calc_sum(int, int*) __attribute__((cdecl));

int main(void) {
  int n;
  int sum;

  printf("Sum integers up to: ");
  scanf("%d", &n);
  calc_sum(n, &sum);
  printf("Sum is %d\n", sum);
  return 0;
}
