probe_alignment_script
======================
#adapted from http://doeidoei.wordpress.com/2011/10/26/easy-sequence-alignment-with-biopython/

#!/usr/bin/env python
# encoding: utf-8

import Biopython

from Bio import pairwise2
from Bio.SubsMat import MatrixInfo as matlist

matrix = matlist.blosum62
gap_open= -10
gap_extend= -0.5

probe0= "AGCAGTGGAGCATGGGTAATGTGTTGGCAGCAGAGAGGCGGGGAGGGAGA
GAGCAGAAGGCTTGTAAATGTTGGATGAGAGAAGTATACATGGCACTGTG
ACTCACTGGAGCTGCCCCAG"
probe1= "CTTGTAAATGTTGGATGAGAGAAGTATACATGGCACTGTGACTCACTGGA
GCTGCCCCAGCACTTGTGAGggcaagtgttttttttttccttttttctac
acAGTCTCtctctttcacac"

alns = pairwise2.align.globalds(probe0, probe1, matrix, gap_open, gap_extend)

top_aln = alns[0]
aln_human, a
