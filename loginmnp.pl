#!/usr/bin/perl
use LWP::UserAgent;


my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->cookie_jar( {file => "/root/lbs/mnp1/mnpcookie.txt",autosave =>1, ignore_discard=> true} );

my $header1 = new HTTP::Headers (
    'User-Agent'     => 'iLocator',
	'Content-Type' => 'application/x-www-form-urlencoded',
);

$url1="https://121.241.253.44/NPCWebGUI/login.do?logoff=yes";
$url2="https://121.241.253.44/NPCWebGUI/login.do";
#$url2="https://121.242.218.91/NPCWebGUI/login.do";


$req = new HTTP::Request('POST',$url1,$header1,'');

$res = $ua->request($req);

$req=new HTTP::Request('POST',$url2,$header1,'userName=sspradiomp&password=Mnp%40123&login=Login&face=18%3A29%3A35&systemTime=18%3A29%3A25');

$res = $ua->request($req);

if($res->content =~ /Login is being used by another user/)
{

	#$req=new HTTP::Request('POST',$url2,$header1,'userName=chattpo&password=usral1%21&login=Login&face=18%3A29%3A35&systemTime=18%3A29%3A25');
        $req=new HTTP::Request('POST',$url2,$header1,'userName=sspradiomp&password=User1%21&login=Login&face=18%3A29%3A35&systemTime=18%3A29%3A25');

	$res = $ua->request($req);
}

#print $res->as_string."\n";

