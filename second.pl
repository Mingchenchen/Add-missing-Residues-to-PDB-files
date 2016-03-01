
# Input from Terminal:- perl second.pl pdb_id(just give pdb id, do not add .pdb) 
# OUTPUT file is alignment.ali


$ st = 'A';
$ strand = 'A';
#!/usr/bin/perl
$firstt = $ARGV[0] . ".pdb" ;
$secondd = $ARGV[0] . ".seq" ;
open(DATA, $firstt) or die "Couldn't open file file, $!";
chomp(@dataArray = <DATA>);
close(DATA);
for ($line = 0; $line < scalar @dataArray; $line++) 
{

   if ($dataArray[$line] =~ m/^ATOM\s+(\d+)\s+(\w+)\s+(\w+)\s(\w+)\s+(\d+).*?/ig)
        
       {         
       $an++;
                    if($4 gt $strand){
                    $amino = 0;
                    $strand = $4;
                    $flag = 1;   

   }
      
                    if(($5 > $amino)&&($strand eq $4)){   
                     
                     $leng = length($3);

                     if($leng > 3)
                       {
                        $abc = scalar reverse("$3");
                        chop($abc);
                        $mrx = scalar reverse("$abc");
                        push @final, $mrx;
                       }
                     else {
                             push @final, $3;
                           }
                     #print $3 . length($3) . "\n ";
                    $cnt++;
                     $sub = $5 - $amino;

                           if($sub>1 && $flag!=1 && $amino!=0) 
                          {  
                          $gap =$sub - 1; 
                          #print " Gap of ". $gap . " " . $residue . " and " . $3. " at "." $amino". "\n"; 
}  
                   $amino = $5;
                   $residue = $3;
                   $a++;
                    $flag =0;
                                                     }
       }

if ($dataArray[$line] =~ m/^HETATM\s+(\d+)\s+(CA)\s+(\w+)\s(\w+)\s+(\d+).*?/ig)
        
       {         
       $an++;
                    if($4 gt $strand){
                    $amino = 0;
                    $strand = $4;
                    $flag = 1;    

  }
      
                    if(($5 > $amino)&&($strand eq $4)){   
                     push @final, $3;
                    $cnt++;
                     $sub = $5 - $amino;

                           if($sub>1 && $flag!=1 && $amino!=0) 
                          {  
                          $gap =$sub - 1; 
                          print " Gap of ". $gap . " " . $residue . " and " . $3. " at "." $amino". "\n"; }  
                   $amino = $5;
                   $residue = $3;
                   $a++;
                    $flag =0;
                                                     }
       }

}

#print @final;
for ($line = 0; $line < scalar @dataArray; $line++) 
{

   if ($dataArray[$line]=~/^SEQRES\s+\d+\s+(\w+)\s+(\d+)\s+(.*+)/) 
      {
       # print $1 , "\t";
   my @words = split / /, $3;
   #print $1;
  if($1 gt $st)
  {
       push @finalseq, "/";
       print "\t\t";
       $st = $1;
  }
   push @finalseq, @words;
     #print $words[0];
       # print $2;
        #print "\n";
     }  
}
my %aa_hash=(
    ALA=>'A', VAL=>'V', PHE=>'F', PRO=>'P', MET=>'M',
    ILE=>'I', LEU=>'L', ASP=>'D', GLU=>'E', LYS=>'K',
    ARG=>'R', SER=>'S', THR=>'T', TYR=>'Y', HIS=>'H',
    CYS=>'C', ASN=>'N', GLN=>'Q', TRP=>'W', GLY=>'G',
    '2AS'=>'D', '3AH'=>'H', '5HP'=>'E', ACL=>'R', AIB=>'A',
    ALM=>'A', ALO=>'T', ALY=>'K', ARM=>'R', ASA=>'D',
    ASB=>'D', ASK=>'D', ASL=>'D', ASQ=>'D', AYA=>'A',
    BCS=>'C', BHD=>'D', BMT=>'T', BNN=>'A', BUC=>'C',
    BUG=>'L', C5C=>'C', C6C=>'C', CCS=>'C', CEA=>'C',
    CHG=>'A', CLE=>'L', CME=>'C', CSD=>'A', CSO=>'C',
    CSP=>'C', CSS=>'C', CSW=>'C', CXM=>'M', CY1=>'C',
    CY3=>'C', CYG=>'C', CYM=>'C', CYQ=>'C', DAH=>'F',
    DAL=>'A', DAR=>'R', DAS=>'D', DCY=>'C', DGL=>'E',
    DGN=>'Q', DHA=>'A', DHI=>'H', DIL=>'I', DIV=>'V',
    DLE=>'L', DLY=>'K', DNP=>'A', DPN=>'F', DPR=>'P',
    DSN=>'S', DSP=>'D', DTH=>'T', DTR=>'W', DTY=>'Y',
    DVA=>'V', EFC=>'C', FLA=>'A', FME=>'M', GGL=>'E',
    GLZ=>'G', GMA=>'E', GSC=>'G', HAC=>'A', HAR=>'R',
    HIC=>'H', HIP=>'H', HMR=>'R', HPQ=>'F', HTR=>'W',
    HYP=>'P', IIL=>'I', IYR=>'Y', KCX=>'K', LLP=>'K',
    LLY=>'K', LTR=>'W', LYM=>'K', LYZ=>'K', MAA=>'A',
    MEN=>'N', MHS=>'H', MIS=>'S', MLE=>'L', MPQ=>'G',
    MSA=>'G', MSE=>'M', MVA=>'V', NEM=>'H', NEP=>'H',
    NLE=>'L', NLN=>'L', NLP=>'L', NMC=>'G', OAS=>'S',
    OCS=>'C', OMT=>'M', PAQ=>'Y',  PCA=>'E', PEC=>'C',
    PHI=>'F', PHL=>'F', PR3=>'C', PRR=>'A', PTR=>'Y',
    SAC=>'S', SAR=>'G', SCH=>'C', SCS=>'C', SCY=>'C',
    SEL=>'S', SEP=>'S', SET=>'S', SHC=>'C', SHR=>'K',
    SOC=>'C', STY=>'Y', SVA=>'S', TIH=>'A', TPL=>'W',
    TPO=>'T', TPQ=>'A', TRG=>'K', TRO=>'W', TYB=>'Y',
    TYQ=>'Y', TYS=>'Y', TYY=>'Y', AGM=>'R', GL3=>'G',
    SMC=>'C', ASX=>'B', CGU=>'E', CSX=>'C', GLX=>'Z',
    UNK=>'X', "/"=>'/'       
);
#foreach(@finalseq)

#{
#  print $aa_hash{$_};
#}

$a = 0;
$flag =0;  
for ($line = 0, $line1 = 0; $line < scalar @final , $line1 < scalar @finalseq ; $line1++) 
{   
   $rt = $finalseq[$line1];

 if($a%75 == 0 && $flag != 0) {
   #print $a;
     push (@dist, "\n");
     push (@new, "\n");
  }
 else

{
   $b++;
}

    if( $finalseq[$line1] eq  $final[$line]) { 
        
        $rr = $finalseq[$line1];
        #print $rr. "  " .$aa_hash{$rr}. "\n ";
        push(@dist, "$aa_hash{$rr}"); 
        $a++; 
   #print $a;
           $flag =1;
        $line++;       
                }  
     else {
                if( $finalseq[$line1] eq "/")
                {
                 push(@dist, "/"); 
                  $a++;
                 }
                 else
                 {
     
    #print "-" ;
    #print $rr. "\n ";
    $amr = "-";
    push(@dist, "$amr"); 
   $a++;
   # print "\t";
   $flag =1;  }
}  
   push(@new, "$aa_hash{$rt}"); 

}
push (@dist, "*");

$rty =0; 
open(DT, $secondd) or die "Couldn't open file file.txt, $!";
open(DTA, "+>alignment.ali") or die "Couldn't open file file.txt, $!";
@ary = <DT>;
print DTA @ary[1];
print DTA @ary[2];

print DTA @dist;
print DTA "\n";
chomp($ary[1]);
$s = $ary[1] . "_fill";
print DTA $s; print DTA "\n"; 
print DTA "sequence:::::::::";
print DTA "\n";
print DTA @new;
print DTA "*";
close (DTA);
close (DT);
print "\n \n aligment.ali file is made\n\n";