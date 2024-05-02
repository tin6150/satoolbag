rocky8 based tool bag, where i had script to install many rpm


there was browsh, but not avail in yum?  check epel?

~~~~~

https://github.com/browsh-org/browsh?tab=readme-ov-file
https://github.com/browsh-org/browsh/releases/download/v1.8.0/browsh_1.8.0_linux_amd64

docker run --rm -it browsh/browsh

singularity pull --name browsh.sif docker://browsh/browsh


~~~~~


cd /global/home/groups/scs/tin/singularity-repo
singularity pull --name satoolbag.sif docker://ghcr.io/tin6150/satoolbag:rocky8
singularity shell       satoolbag.sif
singularity exec        satoolbag.sif  /bin/elinks   http://ipmi-n0175

oh maybe didn't need this, could have pork barrelled on top of:

singularity pull --name tin6150_perf_tools_latest.sif docker://ghcr.io/tin6150/perf_tools:master



TBD:
stuff from 
https://github.com/tin6150/phylotool/blob/tool/install_phylo_tool.sh


there was a pork barrelling... beast?  r4eta?  with things like iperf3

tftpd?

perf_tools
https://github.com/tin6150/perf_tools

that was when singularity and docker build the tools manually.

this repo leverage github workflow cloud build :)


maybe have branch for rocky ve ubuntu

