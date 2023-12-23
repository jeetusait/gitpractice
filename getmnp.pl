#!/usr/local/bin/perl
use LWP::UserAgent;
use HTTP::Cookies;
use Try::Tiny;

my($logFile) = "/root/lbs/mnp1/logs/mnp.log";
open(LOGFILE,">>$logFile") or die("Can't open log file.\n");

my $cookie_jar = HTTP::Cookies->new(
   file     => "/root/lbs/mnp1/mnpcookie.txt",
);

my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
$ua->cookie_jar($cookie_jar);

my $header1 = new HTTP::Headers (
    'User-Agent'     => 'iLocator',
        'Content-Type' => 'application/x-www-form-urlencoded',
);

$url1="https://sa.npindia.in/sahome.do";
$url2="https://sa.npindia.in/processSALoginAction.do";
$url3="https://121.241.253.44/NPCWebGUI/inquiry.do";


my $req=new HTTP::Request('POST',$url3,$header1,'number='.$ARGV[0]."&retrieve=Retrieve");

my $res = $ua->request($req);

#print $res->content;

#print $req->as_string;
#print $res->as_string."\n";

if($res->content =~ /please logon/)
{

        `/root/lbs/mnp1/loginmnp.pl`;
        my $cookie_jar1 = HTTP::Cookies->new(
           file     => "/root/lbs/mnp1/mnpcookie.txt",
        );
        print LOGFILE "Creating Session Again due to Error Code ".$res->code."\n";
        my $ua1 = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
        $ua1->cookie_jar($cookie_jar1);
        $res = $ua1->request($req);
}

try
{
        if($res->code==200)
        {


                my $sindex=index($res->content(),"<span class=\"L2\">");
                if($sindex>0)
                {
                        my $sindex1=index($res->content(),"</span>",$sindex);
                        my $response1=substr($res->content(),$sindex+17,$sindex1-$sindex-17);
                        my $mkindex=index($response1,"Block Owner");
                        my $sindex=index($response1,"ported to");
                        if($sindex>0)
                        {
                                $sindex1=index($response1,",",$sindex);
                                if($sindex1<=0)
                                {
                                        $sindex1=index($response1,"-",$sindex);
                                }
                                if($sindex1>0)
                                {
                                        $response1=substr($response1,$sindex+9,$sindex1-$sindex-9);
                                        $response1=~s/ //g;
                                        print lc($response1)."^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^";
                                        print LOGFILE "Success Response,".$ARGV[0].",$response1\n";
                                }
                                else
                                {
                                        print "Error";
                                        print LOGFILE "Failed Response on Response received at level 2 $response1\n";
                                }
                        }
                        elsif( $response1 =~ /Block Owner/)
                        {
                                $sindex1=index($response1,",",$mkindex);
                                $response1=substr($response1,$mkindex+11,$sindex1-$mkindex-11);
                                $response1=~s/ //g;
                                print lc($response1)."^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^";
                                print LOGFILE "Success Response,".$ARGV[0].",$response1\n";
                        }

                        else
                        {
                                print "Error";
                                print LOGFILE "Failed Response on Response received at level 1 $response1\n";
                        }
                }
                else
                {
                        print "Error";
                        print LOGFILE "Failed Response on Error,".$ARGV[0]." SPAN Class Not Found\n";
                }

        }

}
catch
{
        print "Error";
        print LOGFILE "Failed Response on Error,".$ARGV[0].",".$_."\n";
}



