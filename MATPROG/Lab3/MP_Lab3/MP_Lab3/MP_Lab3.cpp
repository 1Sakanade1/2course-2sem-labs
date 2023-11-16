#include "stdafx.h"
#include <iostream>
#include <iomanip> 
#include "Salesman.h"

#define N 5

using namespace std;

int main()
{
	setlocale(LC_ALL, "rus");

	int d[N][N] = {//1    2     3     4     5        
				  { INF,  12,   27,   INF,  6	},	//  1
				  { 6,    INF,  21,   62,   78  },	//  2
				  { 8,    18,   INF,  86,   55  },	//  3 
				  { 23,   52,   24,   INF,  18  },	//  4
				  { 87,   72,   52,   19,   INF }};	//  5

	int result[N];	// результат 
	int s = salesman(
		N,          // [in]  кол-во городов 
		(int*)d,    // [in]  массив [n*n] расстояний 
		result      // [out] массив [n] маршрут 0 x x x x  
	);

	cout << "\n-- Задача коммивояжера -- ";
	cout << "\n-- количество  городов: " << N;
	cout << "\n-- матрица расстояний : ";

	for (int i = 0; i < N; i++)
	{
		cout << "\n";
		for (int j = 0; j < N; j++)
			if (d[i][j] != INF) 
				cout << setw(3) << d[i][j] << " ";
			else 
				cout << setw(3) << "INF" << " ";
	}

	cout << "\n-- оптимальный маршрут: ";
	for (int i = 0; i < N; i++)
		cout << result[i] + 1 << "-->";

	cout << 1;
	cout << "\n-- длина маршрута     : " << s << "\n";
	system("pause");
	return 0;
}