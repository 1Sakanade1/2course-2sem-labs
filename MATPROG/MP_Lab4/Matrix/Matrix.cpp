// --- main  расстановка скобок  
#include "stdafx.h"
#include <cmath>
#include <memory.h>
#include <iostream>
#include "MultyMatrix.h"   
#define N 6
int _tmain(int argc, _TCHAR* argv[])
{
	clock_t tstart, tend,
		timeR, timeD;

	int Mc[N + 1] = { 20 ,15,  30,  53,  10,  20, 11 }, Ms[N][N], r = 0, rd = 0;

	memset(Ms, 0, sizeof(int) * N * N);

	tstart = clock();
	r = OptimalM(1, N, N, Mc, OPTIMALM_PARM(Ms));
	tend = clock();

	timeR = tend - tstart;

	setlocale(LC_ALL, "rus");
	std::cout << std::endl;
	std::cout << std::endl << "-- расстановка скобок (рекурсивное решение) "
		<< std::endl;
	std::cout << std::endl << "размерности матриц: ";
	for (int i = 1; i <= N; i++) std::cout << "(" << Mc[i - 1] << "," << Mc[i] << ") ";
	std::cout << std::endl << "минимальное количество операций умножения: " << r;
	std::cout << std::endl << std::endl << "матрица S" << std::endl;

	for (int i = 0; i < N; i++)
	{
		std::cout << std::endl;
		for (int j = 0; j < N; j++)  std::cout << Ms[i][j] << "  ";
	}
	std::cout << std::endl;

	memset(Ms, 0, sizeof(int) * N * N);

	tstart = clock();
	rd = OptimalMD(N, Mc, OPTIMALM_PARM(Ms));
	tend = clock();

	timeD = tend - tstart;

	std::cout << std::endl
		<< "-- расстановка скобок (динамическое программирование) " << std::endl;
	std::cout << std::endl << "размерности матриц: ";
	for (int i = 1; i <= N; i++)
		std::cout << "(" << Mc[i - 1] << "," << Mc[i] << ") ";
	std::cout << std::endl << "минимальное количество операций умножения: "
		<< rd;
	std::cout << std::endl << std::endl << "матрица S" << std::endl;
	for (int i = 0; i < N; i++)
	{
		std::cout << std::endl;
		for (int j = 0; j < N; j++)  std::cout << Ms[i][j] << "  ";
	}
	std::cout << std::endl << std::endl;

	std::cout << "Время затраченное на рекурсию: " << timeR << std::endl
		<< "Время затраченное дин. программированием: " << timeD << "\n\n";

	system("pause");

	return 0;
};
