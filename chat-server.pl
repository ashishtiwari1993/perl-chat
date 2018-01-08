use threads;
use IO::Socket::INET;

$| = 1;
$port = 5000;  # Define you port

$socket = IO::Socket::INET->new(
		LocalHost => '127.0.0.1', # Define you server's ip. Now its set to localhost.
		LocalPort => $port,
		Proto	  => 'tcp',
		Listen    => 5,
		Reuse     => 1,
) or die "Coudn't open socket port $port \n" unless $socket;


print "Socket started @ $port \n";

sub handle_connection {

		$request = $_[0];   
		$peer_address = $request->peerhost();
		$peer_port = $request->peerport();  
		print "New Client Connection from IP : $peer_address, PORT : $peer_port\n ";

		while(1){
				$request->recv($receiveData,1024);
				if($receiveData =~ "connectionclose"){
						last;	
				}
				print "$peer_address saying : ".$receiveData;
				print "your msg:";
				$yourMsg = <STDIN>;

				if($yourMsg){
					$request->send($yourMsg);
				}
		}

		close($request);
		threads->exit();
}

while (my $request = $socket->accept) {
		async(\&handle_connection, $request)->detach;
}
