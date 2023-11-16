#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>

using namespace std;

int main()
{
    // Задаем длину строк
    const int len1 = 300;
    const int len2 = 200;

    // Задаем алфавит букв латинского алфавита
    const string alphabet = "abcdefghijklmnopqrstuvwxyz";

    // Генерируем случайную строку S1
    srand(time(NULL));
    string S1 = "";
    for (int i = 0; i < len1; i++) {
        int idx = rand() % alphabet.length();
        S1 += alphabet[idx];
    }

    // Генерируем случайную строку S2
    string S2 = "";
    for (int i = 0; i < len2; i++) {
        int idx = rand() % alphabet.length();
        S2 += alphabet[idx];
    }

    // Выводим строки на экран
    cout << "-------------------------------------------";
    cout << "S1: " << S1 << endl;
    cout << "\n" <<S1.length()<<"\n";

    cout << "-------------------------------------------";
    cout << "S2: " << S2 << endl;

    cout << "\n" << S2.length() << "\n";

    return 0;
}