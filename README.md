# satoolbag
sys admin tool bag - ie fat container with many sys admin programs in it




eg text based web browser like elinks, lynx

browsh (depends on firefox) (even works in wsl terminal!)

~~~~~

docker pull ghcr.io/tin6150/satoolbag:rocky8
docker run -it --rm --entrypoint=/opt/sw/browsh     ghcr.io/tin6150/satoolbag:rocky8   # ctrl-q to quit
docker run -it --rm --entrypoint=/usr/bin/firefox   ghcr.io/tin6150/satoolbag:rocky8

DISPLAY...

singularity pull --name browsh.sif docker://browsh/browsh

