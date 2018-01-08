# perl-chat
Simple perl chat script, allows bidirectional communication over the tcp / ip connection using socket. 

step 1: (terminal window 1)

```
perl chat-server.pl
Socket started @ 5000
```

step 2: (terminal window 2)

On another terminal hit ```telnet``` command to connect with socket. Send your first message to server by just simply type you message in ```telnet console``` (Hello World). 

```
telnet localhost 5000

3Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
Hello World
```

# Output

Window 1 (chat-server.pl): Simply reply in console only.("How are you localhost?")
```
New Client Connection from IP : 127.0.0.1, PORT : 35056
127.0.0.1 saying : Hello World
How are you localhost?
```

Window 2 (telnet session):
```
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
Hello World
webserver saying :How are you localhost?

```

You can use perl chat client ```chatclient.pl``` to avoid telnet session. Start ```chat-server.pl``` and hit below script in new terminal.
```
perl chatclient.pl
```
