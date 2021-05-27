#include <stdint.h>

#ifdef SIMULATION
#define c_test_pass() asm("li x27, 0x01")
#define c_test_fail() asm("li x27, 0x00")
#endif


int mul = 3;
int div = 3;


int main()
{
    int i;
    int res0=0;
    int res1=5050;
    int res2=1;
    int res3=3628800;

    // res0 = 5050
    for (i = 0; i <= 100; i++)
        res0 += i;

    // res1 = 0
    for (i = 0; i <= 100; i++)
        res1 = res1-i;

    // sum = 3628800
    for (i = 1; i <= 10; i++)
        res2 = res2*i;

    // res3 = 1
    for (i = 1; i <= 10; i++)
        res3 = res3/i;
// (res0==5050)&&(res1==0)&&(res2==3628800)&&(res3==1)
    if ((res0==5050)&&(res1==0)&&(res2==3628800)&&(res3==1))
        c_test_pass();
    else
        c_test_fail();

    return 0;
}
