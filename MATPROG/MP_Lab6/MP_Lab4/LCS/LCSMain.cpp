#include <tchar.h>
#include <iostream>
#include "LCS.h"

using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
    setlocale(LC_ALL, "rus");

    char X[] = "Кон", Y[] = "Локон";

    cout << endl << "-- вычисление длины LCS для X и Y(рекурсия)";
    cout << endl << "-- последовательность X: " << X;
    cout << endl << "-- последовательность Y: " << Y;

    int s = lcs(
        sizeof(X) - 1,  // длина последовательности X   
        X,              // последовательность X
        sizeof(Y) - 1,  // длина последовательности Y
        Y               // последовательность Y
    );

    cout << endl << "-- длина LCS: " << s << endl;
    system("pause");
    return 0;
}
