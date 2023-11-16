#include <iostream>
#include <winsock2.h>
using namespace std;

#pragma comment(lib,"ws2_32.lib") 
#pragma warning(disable:4996) 

#define SERVER "127.0.0.1"  // ip адрес UDP сервера
#define BUFLEN 512  // максимальная длинна сообщения
#define PORT 2000  // порт, который прослушивает входящую информацию
int main()
{
    system("title UDP Client");

    // initialise winsock
    WSADATA ws;
    cout<<("Initialising Winsock...");
    if (WSAStartup(MAKEWORD(2, 2), &ws) != 0)
    {
        cout<<("Failed. Error Code: %d", WSAGetLastError());
        return 1;
    }
    cout<<("Initialised.\n");

    // создаем UDP сокет
    sockaddr_in server;
    int client_socket;
    if ((client_socket = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) == SOCKET_ERROR) 
    {
        cout<<("socket() failed with error code: %d", WSAGetLastError());
        return 2;
    }

    // настраиваем адрес, тип протокола, порт
    memset((char*)&server, 0, sizeof(server));
    server.sin_family = AF_INET;
    server.sin_port = htons(PORT);
    server.sin_addr.S_un.S_addr = inet_addr(SERVER);

    // начало коммуникации
        char message[BUFLEN] = "Hello from Client ";

        // отправка сообщения

        for (int i = 0; i < 100; i++) {
            if (sendto(client_socket, message, strlen(message), 0, (sockaddr*)&server, sizeof(sockaddr_in)) == SOCKET_ERROR)
            {
                cout<<("sendto() failed with error code: %d", WSAGetLastError());
                return 3;
            }
        }

        // очищаем буфер 
        char answer[BUFLEN] = {};


        // пытаемся получить сообщение
        int slen = sizeof(sockaddr_in);
        int answer_length;
        if (answer_length = recvfrom(client_socket, answer, BUFLEN, 0, (sockaddr*)&server, &slen) == SOCKET_ERROR)
        {
            cout<<("recvfrom() failed with error code: %d", WSAGetLastError());
            exit(0);
        }

        cout << answer << "\n";
    

    closesocket(client_socket);
    WSACleanup();
}