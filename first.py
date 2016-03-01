
# Get the sequence of the 1omb(or any protein) PDB file, and write to an alignment file
# input from terminal:- mod9.16 m1.py protein_pdb_id(do not add .pdb, just type the protein pdb id)
# Output from terminal:- a sequence file(.seq) will be created by the name protein_pdb_id.seq

import sys
from modeller import *
code = sys.argv[1]

e = environ()
m = model(e, file=code)
aln = alignment(e)
aln.append_model(m, align_codes=code)
aln.write(file=code+'.seq')
