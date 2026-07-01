# satoolbag
sys admin tool bag - ie fat container with many sys admin programs in it


eg text based web browser like elinks, lynx




# test with ephemeral write, docker style
singularity exec --writable-tmpfs  --bind /opt:/opt2,/clusterfs:/clusterfs \
/opt/singularity-repo/tin6150_satoolbag_ub2204.sif \
bash
