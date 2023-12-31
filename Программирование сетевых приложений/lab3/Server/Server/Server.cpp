﻿#include <iostream>
#include <winsock2.h>
using namespace std;

#pragma comment(lib,"ws2_32.lib") // библиотека winsock
#pragma warning(disable:4996) 

#define BUFLEN 512
#define PORT 2000

int main()
{
    system("title UDP Server");

    sockaddr_in server, client;

    // инициализация winsock
    WSADATA wsa;
    printf("Initialising Winsock...");
    if (WSAStartup(MAKEWORD(2, 2), &wsa) != 0)
    {
        printf("Failed. Error Code: %d", WSAGetLastError());
        exit(0);
    }
    printf("Initialised.\n");

    // создаем сокет
    SOCKET server_socket;
    if ((server_socket = socket(AF_INET, SOCK_DGRAM, 0)) == INVALID_SOCKET)
    {
        printf("Could not create socket: %d", WSAGetLastError());
    }
    printf("Socket created.\n");

    // подготовка адреса, протокола, порта сокета
    server.sin_family = AF_INET;
    server.sin_addr.s_addr = INADDR_ANY;
    server.sin_port = htons(PORT);

    // биндим инфу сверху на сокет
    if (bind(server_socket, (sockaddr*)&server, sizeof(server)) == SOCKET_ERROR)
    {
        printf("Bind failed with error code: %d", WSAGetLastError());
        exit(EXIT_FAILURE);
    }
    puts("Bind done.");

    while (true)
    {
        printf("Waiting for data...");
        fflush(stdout);
        char message[BUFLEN] = {};

        // попытка получить сообщение
        int message_len;
        int slen = sizeof(sockaddr_in);

        while (1) {
            if (message_len = recvfrom(server_socket, message, BUFLEN, 0, (sockaddr*)&client, &slen) == SOCKET_ERROR)
            {
                printf("recvfrom() failed with error code: %d", WSAGetLastError());
                exit(0);
            }
        }
            // выводим данные о клиенте и выводим сообщение
            printf("Received packet from %s:%d\n", inet_ntoa(client.sin_addr), ntohs(client.sin_port));
            printf("Data: %s\n", message);

            cin.getline(message, BUFLEN);

            // отвечаем клиенту с тем же сообщением
            if (sendto(server_socket, message, strlen(message), 0, (sockaddr*)&client, sizeof(sockaddr_in)) == SOCKET_ERROR)
            {
                printf("sendto() failed with error code: %d", WSAGetLastError());
                return 3;
            }
        
    }

    closesocket(server_socket);
    WSACleanup();



    cout << "WSACleanap succesfull completed and winsodk32 dll closed";
}

