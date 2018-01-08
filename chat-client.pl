use IO::Socket::INET;
 
# auto-flush on socket
$| = 1;
 
# create a connecting socket
my $socket = new IO::Socket::INET (
    PeerHost => '127.0.0.1',
    PeerPort => '5000',
    Proto => 'tcp',
);
die "cannot connect to the server $!\n" unless $socket;
print "connected to the server\n";

print "your msg :";
$yourMsg = <STDIN>;
$socket->send($yourMsg);

while(1){

		$socket->recv($response,1024);
		
		if($response){
			print "Webserver saying :".$response;
		}

		print "your msg :";
		$msg = <STDIN>;

		if($msg){
				$socket->send($msg);
		}

} 
 
$socket->close();
