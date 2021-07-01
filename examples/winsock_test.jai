/*
    Winsock TCP example ported from:
        https://docs.microsoft.com/en-us/windows/win32/winsock/complete-server-code
*/

BUFFER_LENGTH :: 512;
response_buffer: [BUFFER_LENGTH]u8;

udp_test :: () {
    wsa_data: WSADATA;

    if WSAStartup(WINSOCK_VERSION, *wsa_data) != 0 {
        print("[UDP] Unable to initialize Winsock!\n");
        return;
    }
    defer WSACleanup();

    server: sockaddr_in;
    server.sin_family = AF_INET;
    server.sin_port = htons(7890);
    server.sin_addr.s_addr = htonl(INADDR_ANY);

    sock := socket(AF_INET, SOCK_DGRAM, 0);
    if sock == INVALID_SOCKET {
        print("[UDP] Socket failed with reason: %\n", WSAGetLastError());
        return;
    }
    defer closesocket(sock);

    if bind(sock, cast(*sockaddr)*server, size_of(sockaddr_in)) == SOCKET_ERROR {
        print("[UDP] Bind failed with error: %\n", WSAGetLastError());
        return;
    }

    print("[UDP] Listening at localhost:%\n", ntohs(server.sin_port));

    while true {
        memset(response_buffer.data, 0, BUFFER_LENGTH);

        client: sockaddr_in;
        client_size := size_of(sockaddr_in);

        if recvfrom(sock, response_buffer.data, BUFFER_LENGTH, 0, cast(*sockaddr)*client, xx *client_size) < 0 {
            print("[UDP] Failed while recvfrom: %\n", WSAGetLastError());
            return;
        }

        if sendto(sock, response_buffer.data, BUFFER_LENGTH, 0, cast(*sockaddr)*client, xx client_size) < 0 {
            print("[UDP] Failed while sendto: %\n", WSAGetLastError());
            return;
        }

        print("[UDP] Request:\n\t%", to_string(response_buffer));
        break;
    }
}

tcp_test :: () {
    wsa_data: WSADATA;

    if WSAStartup(WINSOCK_VERSION, *wsa_data) != 0 {
        print("[TCP] Unable to initialize Winsock!\n");
        return;
    }
    defer WSACleanup();

    address: sockaddr_in;
    address.sin_family = AF_INET;
    address.sin_port = htons(7654);
    address.sin_addr.s_addr = inet_addr("127.0.0.1");

    address_len := size_of(sockaddr_in);

    server_socket := socket(address.sin_family, SOCK_STREAM, 0);
    if server_socket == INVALID_SOCKET {
        print("[TCP] Socket failed with error: %\n", WSAGetLastError());
        return;
    }
    defer closesocket(server_socket);

    if bind(server_socket, cast(*sockaddr)*address, xx address_len) == SOCKET_ERROR {
        print("[TCP] Bind failed with error: %\n", WSAGetLastError());
        return;
    }

    if listen(server_socket, SOMAXCONN) == SOCKET_ERROR {
        print("[TCP] Listen failed with error: %\n", WSAGetLastError());
        return;
    }

    client_socket := accept(server_socket, null, null);
    if client_socket == INVALID_SOCKET {
        print("[TCP] Accept failed with error: %\n", WSAGetLastError());
        return;
    }
    defer closesocket(client_socket);

    result := 1;
    while result > 0 {
        memset(response_buffer.data, 0, BUFFER_LENGTH);
        result = recv(client_socket, response_buffer.data, BUFFER_LENGTH, 0, null);

        if result == 0 {
            print("\n[TCP] Client closed connection!\n");
            break;
        }

        if result > 0 {
            print("[TCP] Request:\n\t%", to_string(response_buffer));

            if send(client_socket, response_buffer.data, xx result, 0) == SOCKET_ERROR {
                print("[TCP] Send failed with error: %\n", WSAGetLastError());
                return;
            }
        }
        else {
            print("[TCP] Recv failed with error: %\n", WSAGetLastError());
            return;
        }
    }
}

main :: () {
    print("=== Winsock Tests ===\n");

    print("TCP waiting for connection: 127.0.0.1:7654 - example: echo \"Hello\" | nc -w 0 localhost 7654\n");
    tcp_test();

    print("\nUDP waiting for connection: 127.0.0.1:7890 - example: echo \"Hello\" | nc -w 0 -u localhost 7890\n");
    udp_test();
}

#load "../module.jai";

#import "Basic";
#import "Windows";
