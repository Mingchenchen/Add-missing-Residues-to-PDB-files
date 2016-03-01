#Input from terminal :- perl final.pl pdbid (do not add .pdb) final_pdbfile.pdb
#example:- final.pl 2jgf new.pdb
#A new.pdb file is created

 
#!/usr/bin/perl
$firstt = $ARGV[0] . ".pdb" ;
$secondd = $ARGV[0] . "_fill.B99990001.pdb" ;
open(DATA, $firstt) or die "Couldn't open file file.txt, $!";
chomp(@dataArray = <DATA>);
close(DATA);
$s=1;
$flag=0;
$a=0;
$an=0;
$gp=0;
$flag1=1;
$MODEL=1;
$strand =  "A";
$amino =0;
$cnt =0;
$flag2==0;     
$multichain=0;
%arrayhsh;
$flag9=0;
for ($line = 0; $line < scalar @dataArray; $line++) 
{

   if ($dataArray[$line] =~ m/^ATOM\s+(\d+)\s+(\w+)\s+(\w+)\s(\w+)\s+(\d+).*?/ig)
        
       {    
     
                    if($4 gt $strand){
                    $amino = 0;
                    $strand = $4;
                    $flag = 1;   
                    $multichain =1;
                    $flag9=0;    }
                    
                    if($flag9==0){
                    #$arrayhsh{$4} = $5;
                    push @stname, $4;
                    push @stvalue, $5;
                    $flag9 =1; 
                    }  
      
                    if(($5 > $amino)&&($strand eq $4)){   
                     push @final, $3;
                    $cnt++;
                     $sub = $5 - $amino;

                           if($sub>1 && $flag!=1) 
                          {  
                                   if($flag2==0){ $ornum=$5;}
                                    $flag2=1;
                          $gap =$sub - 1; 
                          print " Gap of ". $gap . " " . $residue . " and " . $3. " at "." $amino". "\n"; 
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
                    $multichain =1;
                    $flag9=0;     }
                    
                    if($flag9==0){
                    #$arrayhsh{$4} = $5;
                    push @stname, $4;
                    push @stvalue, $5;
                    $flag9 =1; 
                    }  
      
                    if(($5 > $amino)&&($strand eq $4)){   
                     push @final, $3;
                    $cnt++;
                     $sub = $5 - $amino;

                           if($sub>1 && $flag!=1) 
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
        print "\n";

        print "\n";
        $st = $stname[0];
for ($line = 0; $line < scalar @dataArray; $line++) 
{

   if ($dataArray[$line]=~/^SEQRES\s+\d+\s+(\w+)\s+(\d+)\s+(.*+)/) 
      {
   my @words = split / /, $3;
   print " the value of 1 and st is " . $1 . "\t" . "$st ". "\n";
  if($1 gt $st)
  {
       push @finalseq, "/";
       print "\t\t";
       $st = $1;
  }
   push @finalseq, @words;
     }  
}
        print "\n";


@gup;
$am=0;
$flag1 =1;
for ($line = 0, $line1 = 0; $line < scalar @final , $line1 < scalar @finalseq ; $line1++) 
{   
     
    if( $finalseq[$line1] eq  $final[$line]) {
        $line++;        
        $flag1=0;             
                                             }
                                             
                                                  if($flag1==1)
                                                 {
                                                   $gup[$am]++;
                                                  }
    if($finalseq[$line1] eq "/" && $finalseq[$line1+1] ne  $final[$line+1]){
    
    $flag1=1;
    $am++;                   }
       
}
@keys = keys %arrayhsh;
print "the lengh is \t" . scalar @gup . "\n";
print " The staring gap is  " . $gup[0] . " \n" ;



print @gup;
print "\n";



print " The staring number is  " . $ornum . " \n" ;
$h_strand= "A";
$gta=0;
$nt=1;
open(DAT, $secondd) or die "Couldn't open file modeller file, $!";
chomp(@dA = <DAT>);
close(DAT);
for ($line = 0; $line < scalar @dA; $line++)
{   
  if($multichain == 0)  {     
              #           ATOM       24        N        SER        4   1.931  28.645  35.160  1.00 52.61           N
     if ($dA[$line] =~ m/(\w+)(\s+)(\d+)(\s+)(\w+)(\s+)(\w+)(\s+)(\d+)(.*+)/ig) {
#                          1     2    3    4    5    6    7   8     9   10    
    #print $dA[$line];
    $s=$9+$stvalue[0]-1-$gup[0];
    if($s<10)
    { $e="   ";
    }
    if($s>9&&$s<99)
    { $e="  ";
    }
    if($s>99)
    { $e=" ";
    }
    push @pdb, $1.$2.$3.$4.$5.$6.$7." ". $stname[0].$e.$s.$10;
    push @pdb, "\n";
                                                                                  }
                         #TER      4296      THR        H        540           
     if ($dA[$line] =~ m/^TER(\s+)(\d+)(\s+)(\w+)(\s+)(\w)(\s+)(\d+)/ig)
     #                          1   2    3     4   5    6   7     8 
     {  
       push @pdb, "TER" . $1.$2.$3.$4.$5.$stname[0].$e.$s;
       push @pdb, "\n";
     }
                            }     
                        
    else {
#                   ATOM        18       CA        VAL        A         4   -1.013  29.368  37.878  1.00 11.67           C  
if ($dA[$line] =~ m/(\w+)(\s+)(\d+)(\s+)(\w+)(\s+)(\w+)(\s+)(\w+)(\s+)(\d+)(.*+)/ig) {
#                     1     2    3    4    5    6    7   8     9   10    11   12
    #print $dA[$line];
    if($9 gt $h_strand){
                    $gta++;
                    $h_strand = $9;
                    $nt=$11;  }
                    
    $s=$11+$stvalue[$gta]-$nt-$gup[$gta];
    $e=$10;
    if($s<10)
    { $e="   ";
    }
    if($s>9&&$s<99)
    { $e="  ";
    }
    if($s>99)
    { $e=" ";
    }
    push @pdb, $1.$2.$3.$4.$5.$6.$7.$8.$stname[$gta].$e.$s.$12;
    push @pdb, "\n";   
                                                                                   }  
        if ($dA[$line] =~ m/^TER(\s+)(\d+)(\s+)(\w+)(\s+)(\w)(\s+)(\d+)/ig)
     #                            1   2    3     4   5    6     7     8 
     {  
       push @pdb, "TER" . $1.$2.$3.$4.$5.$stname[$gta].$e.$s;
       push @pdb, "\n";
     }                                                                                
}
   
}
close (DAT);

#print @pdb;




for ($line = 0; $line < scalar @dataArray; $line++) 
{    
   
   if ($dataArray[$line] =~ m/^ATOM(.*?)/)
     {  
        last;  
     }
   push @pdb1, $dataArray[$line];
   push @pdb1, "\n";
   
}

for ($line = 0; $line < scalar @dataArray; $line++) 
{    
   
   if ($dataArray[$line] =~ m/^TER(.*?)/ig)
     {  
        $ct=$line;  
     }   
   
}

for ($line = $ct+1; $line < scalar @dataArray; $line++) 

{
   push @pdb2, $dataArray[$line];
   push @pdb2, "\n";

}


open(OF, "+>>$ARGV[1]");
print OF @pdb1;
print OF @pdb;
print OF @pdb2;
close OF;
