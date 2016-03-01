# NEED TO CHANGE THIS PROGRAM BEFORE RUNNING
# Change the name of protein with your own protein in 15th line of this program in both know "---" and sequence "yourproteinname_fill"
# Input from terminal:- third.py
# OUTPUT will be a pdb file will with protein name with _fill.B99990001.pdb in ending.

from modeller import *
from modeller.automodel import *    # Load the automodel class

log.verbose()
env = environ()

# directories for input atom files
env.io.atom_files_directory = ['.', '../atom_files']

env.io.hetatm = True


a = loopmodel(env, alnfile = 'alignment.ali',
              knowns = '3l9k' , sequence = '3l9k_fill')
a.starting_model= 1
a.ending_model  = 1

a.loop.starting_model = 1
a.loop.ending_model   = 2
a.loop.md_level       = refine.fast

a.make()

