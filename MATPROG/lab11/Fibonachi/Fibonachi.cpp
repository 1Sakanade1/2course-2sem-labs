#include <ctime>
#include <iostream>

unsigned int fibonacci( int n)
{
    return n < 2 ? n : fibonacci(n - 2) + fibonacci(n - 1);
}

int main()
{
    const  int N = 100;
    int z;
    clock_t  t1 = 0, t2 = 0;
    for ( int i = 0; i < N; i++)
    {
        t1 = clock();                            // фиксация времени 
        z = fibonacci(i);
        t2 = clock();                            // фиксация времени 
        std::cout << i << ": " << z <<"\t" << ((double)(t2 - t1)) / ((double)CLOCKS_PER_SEC) << std::endl;
    
    }

    return 0;
}