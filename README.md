probe_alignment_script
======================
This is the readme file to run the probe-alignment_script. Just enter terminal and run

>python location/of/probe_alignment_script

To pull down the initial version of the script. From within terminal navigate to the coding directory withing the research folder. Then type

>git clone http://github.com/PrincessG/probe_alignment_script.git

To set things up on a directory on your computer from within terminal navigate to the github directory within the acanthomorph folder. If you haven't done so already, assign the original repository to a remote called "upstream" by typing the following:

>git remote add upstream https://github.com/PrincessG/probe_alignment_script.git

As of 1.21.2013 I have done everything above so all you have to do not is pull down the most recent version of the script. This will pull in changes not present in your local repository, without modifying your files. Don't forget to navigate to directory on computer where your respository lives.
 
>git fetch upstream

Then if that goes smoothly...
>git merge upstream/master

To run the script just type
> python Code.psg 

Additionaly I added another script that parses the marker data into separate entries. You can run that script by 
>python probe_parse.psg UCE_PROBES.fasta

The next step is add a for loop to the above script that will actually spit out each entry into it's own text file. The easiest way to do this is to add the following to the probe_parse.psg script:

>OutFileName = "LocusSpecificProbeSpecificName"
>OutFile = open( OutFileName,'w')


Ideally I want to the file names to get passed from the original first part of fasta listings. ###_oryLat2_chr##_######_#######|probe_0 OR ###_oryLat2_chr##_######_#######|probe_1. 
