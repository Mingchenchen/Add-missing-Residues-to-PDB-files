# Missing-Residue-
Add missing residue to pdb files

The following programs will help in generating missing residues from pdb files. 
Before running the programs, install Modeller(https://salilab.org/modeller/) and python. Modeller is freely available.
Instruction for running each program is given in the starting of each program.
Run the program if the following series.
1. mod9.16 first.py (require Modeller and Python)
2. second.pl (based on Perl)
3. mod9.16 third.py (require Modeller and Python) 
4. perl final.pl 

Example to run if the protein is 1ajq

1. mod9.16 first.py 1ajq
2. second.pl 1ajq
3. mod9.16 third.py(open the program and modify a bit. Instructions are given in program).
4. perl final.pl 1ajq new.pdb (a final pdb file with name new.pdb will be created).
