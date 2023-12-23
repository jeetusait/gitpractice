#!/usr/local/bin/perl

 use warnings;
 use strict;
 use XML::Compile::Schema;
 use XML::LibXML::Reader;
 use XML::Twig;
 use IO::File;
 use LWP::UserAgent;
 use HTTP::Request::Common;

 {
 package iLocator;

 use HTTP::Server::Simple::CGI;
 use base qw(HTTP::Server::Simple::CGI);
        sub net_server { 'Net::Server::Fork' };
 use DBI();
 use Data::Dumper;
 use Try::Tiny;
use POSIX qw(strftime);

        $SIG{CHLD}="IGNORE";

 sub replace_xml_tagval
 {
         my ($doc,$fieldname,$fieldval)=@_;
         try
         {

                my $root=$doc->getDocumentElement;
                my ($node)=$root->findnodes($fieldname);
                $node->removeChildNodes();
                $node->appendText($fieldval);
        }
        catch
        {
                warn "Failed on Error ".$fieldname." _ ".$fieldval."\n";
        }
 }

 sub replace_xml_fieldval
 {
        my ($doc,$fieldname,$fieldval)=@_;
        my $root=$doc->getDocumentElement;
        my ($node)=$root->findnodes($fieldname);
        $node->setValue($fieldval);
 }

 my %dispatch = (
     '/hello' => \&resp_hello,
         '/getlocation' => \&getlocation,
     # ...
 );

 sub handle_request {
     my $self = shift;
     my $cgi  = shift;

     my $path = $cgi->path_info();
     my $handler = $dispatch{$path};

     if (ref($handler) eq "CODE") {
         print "HTTP/1.0 200 OK\r\n";
         $handler->($cgi);

     } else {
         print "HTTP/1.0 404 Not found\r\n";
         print $cgi->header,
               $cgi->start_html('Not found'),
               $cgi->h1('Not found'),
               $cgi->end_html;
     }
 }

 sub resp_hello {
     my $cgi  = shift;   # CGI.pm object
     return if !ref $cgi;

     my $who = $cgi->param('POSTDATA');

     print $cgi->header,
           $cgi->start_html("Hello"),
           $cgi->h1("Hello $who!"),
           $cgi->end_html;
 }

 sub getlocation
 {
        my $pid=fork();
        if($pid==0)
        {
        my $reqdt=strftime('%Y-%m-%d %H:%M:%S',localtime());
         my $dbh = DBI->connect("DBI:mysql:database=ilocate;host=localhost", "ilmp", "ilmp123", {'RaiseError' => 1});

         my $responsexml='<iLocator>
<Response>

<msisdn>V_MSISDN</msisdn>
<timestamp>V_TIMESTAMP</timestamp>

<success>V_SUCCESS</success>

<latitude>V_LATITUDE</latitude>
<longitude>V_LONGITUDE</longitude>
<reachability>V_REACHABLE</reachability>
<locationtype>V_LOCATIONTYPE</locationtype>
<METADATA>
<name>V_NAME</name>
<address1>V_ADDRESS1</address1>
<address1type>V_ADDRESSTYPE1</address1type>
<address2>V_ADDRESS2</address2>
<address2type>V_ADDRESSTYPE2</address2type>
<activedt>V_ACTIVEDT</activedt>

</METADATA>

<OPTIONAL>
<PARAM1></PARAM1>
<PARAM2></PARAM2>
<PARAM3></PARAM3>
<PARAM4></PARAM4>
</OPTIONAL>

</Response>
</iLocator>
';

         my $errxml='<iLocator>
<Response>
<error></error>
<PARAM1></PARAM1>
<PARAM2></PARAM2>
<PARAM3></PARAM3>
<PARAM4></PARAM4>
</Response>
</iLocator>
';

my $cgi  = shift;   # CGI.pm object
return if !ref $cgi;

print $cgi->header;
#print $_;

#print Dumper($cgi);


        my($logFile) = "ilocate.log";
    my($script)  = __FILE__;
    my($name)    = $ENV{'REMOTE_HOST'};
    my($addr)    = $ENV{'REMOTE_ADDR'};
    my($reqtime)    = time;


    open(LOGFILE,">>$logFile") or die("Can't open log file.\n");
    print LOGFILE ("$script!$name!$addr!$reqtime\n");


my $parser = XML::LibXML->new;
my $postdata=$cgi->param('POSTDATA');
$postdata=~s/\'//g;
my $doc=$parser->parse_string( $postdata);

my $username=$doc->find('//username');
my $password=$doc->find('//password');
my $msisdn=$doc->find('//msisdn');

my $timestamp=$doc->find('//timestamp');
my $provide_meta=$doc->find('//provide_meta');
my $starttime=$doc->find('//starttime');
my $stoptime=$doc->find('//stoptime');
my $frequency=$doc->find('//frequency');
my $param1=$doc->find('//PARAM1');
my $param2=$doc->find('//PARAM2');
my $param3=$doc->find('//PARAM3');
my $param4=$doc->find('//PARAM4');




#print "$username $password\n";

# Check Correct Username

my $errflg=0;
my $error="";
my $resp;
my $sth;
my $result;

        if($username eq "" || $password eq "")
        {
                $errflg=1;
                $error="Username/Password provided is incorrect";
                #die "Failed on User Validation $error";
        }
        elsif($username =~ m/[^a-zA-Z]/)
        {
                $errflg=1;
                $error.="\nUsername can only contian alphabets";
                #die "Failed on User Validation $error";

        }
        else
        {
                $sth=$dbh->prepare("select username,password from usermaster where username='".$username."'");
                $sth->execute();
                if($sth->rows==0)
                {
                        $errflg=1;
                        $error.="\nUsername not found";
                        #die "Failed on User Validation $error";
                }
                else
                {
                        $result = $sth->fetchrow_hashref();
                        #print 'Password is '.$result->{'password'};

                        if(! ($password eq $result->{'password'}))
                        {
                                $errflg=1;
                                $error.="\nIncorrect Password Entered";
                                #die "Failed on User Validation $error";
                        }

                }

        }
        if($errflg==1)
        {
                my $errdoc=$parser->parse_string($errxml);
                replace_xml_tagval($errdoc,'//error',$error);
                replace_xml_tagval($errdoc,'//PARAM1',$param1);
                replace_xml_tagval($errdoc,'//PARAM2',$param2);
                replace_xml_tagval($errdoc,'//PARAM3',$param3);
                replace_xml_tagval($errdoc,'//PARAM4',$param4);
                print $errdoc->toString();
                print LOGFILE "Login Failed for User $username with error $error";
                close(LOGFILE);
                $sth->finish;
                $sth=$dbh->prepare("insert into accesslog(requesttime,request,response,responsetimestamp,responseflag,username,reqip) values('$reqdt','".$doc->toString()."','".$errdoc->toString()."',now(),1,'".$username."','".$ENV{'REMOTE_HOST'}."')");

                $sth->execute();

                $sth->finish;

                $dbh->disconnect;
                return;
        }


        ################################
        #Query on Test Data
        ################################

        $sth->finish;


        $sth=$dbh->prepare("Select count(1) cnt from testdata");
        $sth->execute;

        $result = $sth->fetchrow_hashref();

        my $row=int(rand($result->{'cnt'}))+1;
        $sth->finish;



        $sth=$dbh->prepare("select latitude, longitude, success, reachability, name, address1, address1type, address2, address2type, mnpflg, date_format(utc_timestamp,'%Y%m%d%H%i%s') timestamp from testdata where rownum=0");

        $sth->execute();
        $result = $sth->fetchrow_hashref();

        my $resdoc=$parser->parse_string($responsexml);


        `./getaddress.sh $msisdn > /tmp/$msisdn.out 2>/dev/null`;
        my $omsisdn=$msisdn;
        my $record="";
        open my $tmpfile,"<","/tmp/$msisdn.out";
        $record=<$tmpfile>;
        close $tmpfile;


        if(length($record)<2)
        {
                $record="||||||||||||||||||||||||||||||||||||||||||";
        }
        print LOGFILE "Record is $record \n";
        my $successresp="false";

        my @recorddata=split /\^/, $record;

        #my $resdoc=$parser->parse_string($responsexml);

        if(length($msisdn)==10)
        {
                $msisdn='91'.$msisdn;
        }
	elsif(length($msisdn)==11)
        {
        $msisdn='91'.substr($msisdn,1);
        }

        my($locresp,@locresparr);
        my ($latresp,$longresp,$reachresp,$lbsresp);
        my $oper='';

        if($recorddata[0]=~/jio/||$recorddata[0]=~/rjil/)
        {
                $locresp=`/root/lbs/tata/riljio1 $msisdn`;
                @locresparr=split /,/, $locresp;
                print LOGFILE "\n Location Response is : ".$locresp.",$msisdn,Jio\n";
                if($locresp =~ /Error/)
                {
                        $latresp=0;
                        $longresp=0;
                        $successresp="false";
                        $reachresp="false";
                        $lbsresp="ADDRESS";
                        print LOGFILE "\n".$result->{'timestamp'}.":ERRJIO: Location Request Failed on Query *** : $msisdn : $recorddata[0]\n";

                }
                else
                {
                        $latresp=$locresparr[0];
                        $longresp=$locresparr[1];
                        $successresp="true";
                        $reachresp="true";
                        $lbsresp="LBS";
                        print LOGFILE "\n".$result->{'timestamp'}.":SUCCJIO: Success Location Response *** : $msisdn : $recorddata[0]\n";
                }
                                $oper='jio';

        }
        elsif($recorddata[0]=~/airtel/)
        {
                $locresp=`/root/lbs/tata/get_token.sh $msisdn`;
                if($locresp =~ /,/)
                {
                        @locresparr=split /,/, $locresp;
                }
                else
                {
                        $locresp="0,0";
                }
                print LOGFILE "\n Location Response is : ".$locresp.",$msisdn,airtel\n";
                if($locresp =~ /Error/)
                {
                        $latresp=0;
                        $longresp=0;
                        $successresp="false";
                        $reachresp="false";
                        $lbsresp="ADDRESS";
                        print LOGFILE "\n".$result->{'timestamp'}.":ERRAIRTEL: Location Request Failed on Query *** : $msisdn : $recorddata[0]\n";

                }
                else
                {
                        $latresp=$locresparr[0];
                        $longresp=$locresparr[1];
                        $successresp="true";
                        $reachresp="true";
                        $lbsresp="LBS";

                        print LOGFILE "\n".$result->{'timestamp'}.":SUCCAIRTEL: Success Location Response *** : $msisdn : $recorddata[0]\n";
                }
                $oper='airtel';

        }
        elsif($recorddata[0]=~/landlineair/ )
        {
                $locresp=`/root/lbs/tata/getlandline.pl $msisdn`;
                @locresparr=split /,/, $locresp;
                print LOGFILE "\n Location Response is : ".$locresp.",$msisdn,AIRTELLL\n";
                if($locresp =~ /Error/)
                {
                        $latresp=0;
                        $longresp=0;
                        $successresp="false";
                        $reachresp="false";
                        $lbsresp="ADDRESS";
                        print LOGFILE "\n".$result->{'timestamp'}.":ERRAIRTELLL: Location Request Failed on Query *** : $msisdn : $recorddata[0]\n";
                }
                else
                {
                        $latresp=$locresparr[0];
                        $longresp=$locresparr[1];
                        $successresp="true";
                        $reachresp="true";
                        $lbsresp="LBS";
                        print LOGFILE "\n".$result->{'timestamp'}.":SUCCAIRTELLL: Success Location Response *** : $msisdn : $recorddata[0]\n";
                }
                                $oper='airtelll';
       
        }
        elsif($recorddata[0]=~/tata/)
        {
                $locresp=`/root/lbs/tata/get_token.sh $msisdn`;
                if($locresp =~ /,/)
                {
                        @locresparr=split /,/, $locresp;
                }
                else
                {
                        $locresp="0,0";
                }
                print LOGFILE "\n Location Response is : ".$locresp.",$msisdn,airtel\n";
                if($locresp =~ /Error/)
                {
                        $latresp=0;
                        $longresp=0;
                        $successresp="false";
                        $reachresp="false";
                        $lbsresp="ADDRESS";
                        print LOGFILE "\n".$result->{'timestamp'}.":ERRTATA: Location Request Failed on Query *** : $msisdn : $recorddata[0]\n";

                }
                else
                {
                        $latresp=$locresparr[0];
                        $longresp=$locresparr[1];
                        $successresp="true";
                        $reachresp="true";
                        $lbsresp="LBS";

                        print LOGFILE "\n".$result->{'timestamp'}.":SUCCTATA: Success Location Response *** : $msisdn : $recorddata[0]\n";
                }
                $oper='airtel';

        }

        elsif($recorddata[0]=~/voda/)
        {
                $locresp=`/root/lbs/tata/vodafone.pl $msisdn`;
                @locresparr=split /,/, $locresp;
                print LOGFILE "\n Location Response is : ".$locresp.",$msisdn,Vodafone\n";
                if($locresp =~ /Error/)
                {
                        $latresp='';
                        $longresp='';
                        $successresp="false";
                        $reachresp="false";
                        $lbsresp="ADDRESS";
                        print LOGFILE "\n".$result->{'timestamp'}.":ERRVODAFONE: Location Request Failed on Query *** : $msisdn : $recorddata[0]\n";

                }
                else
                {
                        $latresp=$locresparr[0];
                        $longresp=$locresparr[1];
                        $successresp="true";
                        $reachresp="true";
                        $lbsresp="LBS";

                        print LOGFILE "\n".$result->{'timestamp'}.":SUCCVODAFONE: Success Location Response *** : $msisdn : $recorddata[0]\n";
                }
                                $oper='vodafone';

        }
        elsif($recorddata[0]=~/idea/)
        {
                $locresp=`/root/lbs/tata/vodafone.pl $msisdn`;
                @locresparr=split /,/, $locresp;
                print LOGFILE "\n Location Response is : ".$locresp.",$msisdn,idea\n";
                if($locresp =~ /Error/)
                {
                        $latresp=0;
                        $longresp=0;
                        $successresp="false";
                        $reachresp="false";
                        $lbsresp="ADDRESS";
                        print LOGFILE "\n".$result->{'timestamp'}.":ERRIDEA: Location Request Failed on Query *** : $msisdn : $recorddata[0]\n";

                }
                else
                {
                        $latresp=$locresparr[0];
                        $longresp=$locresparr[1];
                        $successresp="true";
                        $reachresp="true";

                        $lbsresp="LBS";
                        print LOGFILE "\n".$result->{'timestamp'}.":SUCCIDEA: Success Location Response *** : $msisdn : $recorddata[0]\n";
                }
                                $oper='vodafone';

        }
        elsif($recorddata[0]=~/bsnlmpll/ || $recorddata[0]=~/bsnlmpll/)
        {
                $locresp=`/root/lbs/tata/getlandline.pl $msisdn`;
                @locresparr=split /,/, $locresp;
                print LOGFILE "\n Location Response is : ".$locresp.",$msisdn,BSNLLL\n";
                if($locresp =~ /Error/)
                {
                        $latresp=0;
                        $longresp=0;
                        $successresp="false";
                        $reachresp="false";
                        $lbsresp="ADDRESS";
                        print LOGFILE "\n".$result->{'timestamp'}.":ERRBSNLLL: Location Request Failed on Query *** : $msisdn : $recorddata[0]\n";
                }
                else
                {
                        $latresp=$locresparr[0];
                        $longresp=$locresparr[1];
                        $successresp="true";
                        $reachresp="true";
                        $lbsresp="LBS";
                        print LOGFILE "\n".$result->{'timestamp'}.":SUCCBSNLLL: Success Location Response *** : $msisdn : $recorddata[0]\n";
                }
                                $oper='bsnlll';

        }
        elsif($recorddata[0]=~/bsnl/ || $recorddata[0]=~/mtnl/ || $recorddata[0]=~/bharat/ || $recorddata[0] =~ /dolphin/ || $recorddata[0] =~ /mahanagar/)
        {
                $locresp=`/root/lbs/tata/bsnl_mp.pl $msisdn`;
                @locresparr=split /,/, $locresp;
                print LOGFILE "\n Location Response is : ".$locresp.",$msisdn,BSNLMTNL\n";
                if($locresp =~ /Error/ || $locresparr[0] == 0)
                {
                        $latresp=0;
                        $longresp=0;
                        $successresp="false";
                        $reachresp="false";
                        $lbsresp="ADDRESS";
                        print LOGFILE "\n".$result->{'timestamp'}.":ERRBSNL: Location Request Failed on Query *** : $msisdn : $recorddata[0]\n";
                }
                else
                {
                        $latresp=$locresparr[0];
                        $longresp=$locresparr[1];
                        $successresp="true";
                        $reachresp="true";
                        $lbsresp="LBS";
                        print LOGFILE "\n".$result->{'timestamp'}.":SUCCBSNL: Success Location Response *** : $msisdn : $recorddata[0]\n";
                }
                                $oper='bsnl';
        }
         elsif($recorddata[0]=~/uninor/ || $recorddata[0]=~/telenor123/)
        {
                $locresp=`/root/lbs/tata/get_token.sh $msisdn`;
                if($locresp =~ /,/)
                {
                        @locresparr=split /,/, $locresp;
                }
                else
                {
                        $locresp="0,0";
                }
                print LOGFILE "\n Location Response is : ".$locresp.",$msisdn,airtel\n";
                if($locresp =~ /Error/)
                {
                        $latresp=0;
                        $longresp=0;
                        $successresp="false";
                        $reachresp="false";
                        $lbsresp="ADDRESS";
                        print LOGFILE "\n".$result->{'timestamp'}.":ERRUNINOR: Location Request Failed on Query *** : $msisdn : $recorddata[0]\n";

                }
                else
                {
                        $latresp=$locresparr[0];
                        $longresp=$locresparr[1];
                        $successresp="true";
                        $reachresp="true";
                        $lbsresp="LBS";

                        print LOGFILE "\n".$result->{'timestamp'}.":SUCCUNINOR: Success Location Response *** : $msisdn : $recorddata[0]\n";
                }
                $oper='airtel';

        }
        elsif($recorddata[0]=~/reliance/)
        {
                $locresp=`/root/lbs/tata/riljio.sh $msisdn`;
                @locresparr=split /,/, $locresp;
                print LOGFILE "\n Location Response is : ".$locresp.",$msisdn,Jio\n";
                if($locresp =~ /Error/)
                {
                        $latresp=0;
                        $longresp=0;
                        $successresp="false";
                        $reachresp="false";
                        $lbsresp="ADDRESS";
                        print LOGFILE "\n".$result->{'timestamp'}.":ERRJIO: Location Request Failed on Query *** : $msisdn : $recorddata[0]\n";

                }
                else
                {
                        $latresp=$locresparr[0];
                        $longresp=$locresparr[1];
                        $successresp="true";
                        $reachresp="true";
                        $lbsresp="LBS";
                        print LOGFILE "\n".$result->{'timestamp'}.":SUCCJIO: Success Location Response *** : $msisdn : $recorddata[0]\n";
                }
                                $oper='jio';

        }
        elsif($recorddata[0]=~/aircel/)
        {
                $locresp=`/root/lbs/tata/get_token.sh $msisdn`;
                @locresparr=split /,/, $locresp;
                print LOGFILE "\n Location Response is : ".$locresp.",$msisdn,Aircel\n";
                if($locresp =~ /Error/)
                {
                        $latresp=0;
                        $longresp=0;
                        $successresp="false";
                        $reachresp="false";
                        $lbsresp="ADDRESS";
                        print LOGFILE "\n".$result->{'timestamp'}.":ERRAIRCEL: Location Request Failed on Query *** : $msisdn : $recorddata[0]\n";

                }
                else
                {
                        $latresp=$locresparr[1];
                        $longresp=$locresparr[0];
                        $successresp="true";
                        $reachresp="true";
                        $lbsresp="LBS";
                        print LOGFILE "\n".$result->{'timestamp'}.":SUCCAIRCEL: Success Location Response *** : $msisdn : $recorddata[0]\n";
                }
                                $oper='airtel';

        }
        unlink "/tmp/$omsisdn.out";

        replace_xml_tagval($resdoc,'//msisdn',$msisdn);
        replace_xml_tagval($resdoc,'//PARAM1',$param1);
        replace_xml_tagval($resdoc,'//PARAM2',$param2);
        replace_xml_tagval($resdoc,'//PARAM3',$param3);
        replace_xml_tagval($resdoc,'//PARAM4',$param4);
        replace_xml_tagval($resdoc,'//timestamp',$result->{'timestamp'});
        $successresp='true';
        replace_xml_tagval($resdoc,'//success',$successresp);
        replace_xml_tagval($resdoc,'//latitude',$latresp);
        replace_xml_tagval($resdoc,'//longitude',$longresp);
        replace_xml_tagval($resdoc,'//reachability',$reachresp);
        replace_xml_tagval($resdoc,'//locationtype',$lbsresp);
        replace_xml_tagval($resdoc,'//name',$recorddata[5]);
        replace_xml_tagval($resdoc,'//address1',$recorddata[6].",".$recorddata[7].",".$recorddata[8].",".$recorddata[9].",".$recorddata[10].",".$recorddata[18]);
        replace_xml_tagval($resdoc,'//address1type','BILLING');
        replace_xml_tagval($resdoc,'//address2',$recorddata[14]);
        replace_xml_tagval($resdoc,'//address2type','INSTALLATION');

        my $basenode=$resdoc->findnodes("//METADATA")->[0];

        my $metadatatag=XML::LibXML::Element->new("METAVALUES");
        my $nameofvalue=XML::LibXML::Element->new("nameofvalue");
        my $nameofvalue_val=XML::LibXML::Text->new("MNPFLG");
        my $nodvalue=XML::LibXML::Element->new("value");
        my $nodvalue_val=XML::LibXML::Text->new('0');

        $nodvalue->addChild($nodvalue_val);
        $nameofvalue->addChild($nameofvalue_val);

        $metadatatag->addChild($nameofvalue);
        $metadatatag->addChild($nodvalue);

        $basenode->addChild($metadatatag);

        print $resdoc->toString();

        print LOGFILE "Location Query Successful $msisdn \n";


        print LOGFILE "--------------- \n";


        # create table accesslog (rownum smallint AUTO_INCREMENT primary key, datetime timestamp DEFAULT CURRENT_TIMESTAMP , request varchar(500),response varchar(2000), responsetimestamp timestamp, responseflag smallint default 0, username varchar(20), reqip varchar(20) );
        $sth->finish;

        print LOGFILE "\nRequest is ------ ".$doc->toString()." ------ ";
        print LOGFILE "\nResponse is ------ ".$resdoc->toString()." ------ ";



        $sth=$dbh->prepare("insert into accesslog(requesttime,request,response,responsetimestamp,responseflag,username,reqip,msisdn,operator,locresponse) values('$reqdt','".$doc->toString()."','".$resdoc->toString()."',now(),1,'".$username."','".$ENV{'REMOTE_HOST'}."','".$msisdn."','$oper','$latresp,$longresp')");

        $sth->execute();

        $sth->finish;

        $dbh->disconnect;

        #create table testdata (rownum smallint,latitude varchar(20),longitude varchar(20),success varchar(20),reachability varchar(20), name varchar(50), address1 varchar(100), address1type varchar(20), address2 varchar(100), address2type varchar(20), mnpflg varchar(10));
        #insert into testdata values(1,'26.8048175','81.0058092','true','true','Mitesh Vageriya','Amar Shaheed Path, Lucknow','INSTALLATION', 'VIRAT KHAND, LUCKNOW','BILLING','true');






close(LOGFILE);
exit 0;

}




#print $cgi->header,
#print $responsexml;
 #     $cgi->start_html("Hello"),
  #    $cgi->h1("Hello $who!"),
   #   $cgi->end_html;

 }

 }

 # start the server on port 8080
 my $pid = iLocator->new(9095)->background();
 print "Use 'kill $pid' to stop server.\n";
