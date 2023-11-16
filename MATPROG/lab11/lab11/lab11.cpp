#include "stdafx.h"
#include "Auxil.h"                            // вспомогательные функции 
#include <iostream>
#include <ctime>
#include <locale>

#define  CYCLE  1000000                       // количество циклов  

int main()
{
	int current = CYCLE;
	double  av1 = 0, av2 = 0;
	clock_t  t1 = 0, t2 = 0;

	setlocale(LC_ALL, "rus");

	auxil::start();                          // старт генерации 
	t1 = clock();   // фиксация времени
	while(current != 11000000) {
		for (int i = 0; i < current; i++)
		{
			av1 += (double)auxil::iget(-100, 100); // сумма случайных чисел 
			av2 += auxil::dget(-100, 100);         // сумма случайных чисел 
		}
		t2 = clock();                            // фиксация времени 


		std::cout << std::endl << "количество циклов:         " << current;
		std::cout << std::endl << "среднее значение (int):    " << av1 / current;
		std::cout << std::endl << "среднее значение (double): " << av2 / current;
		std::cout << std::endl << "продолжительность (у.е):   " << (t2 - t1);
		std::cout << std::endl << "                  (сек):   "
			<< ((double)(t2 - t1)) / ((double)CLOCKS_PER_SEC);
		std::cout << std::endl;
		current += CYCLE;
	}
	system("pause");
}
