FROM psitrax/powerdns

RUN mv /entrypoint.sh /entrypoint_stage2.sh
ADD entrypoint_stage1.sh /entrypoint_stage1.sh
RUN chmod +x entrypoint_stage1.sh 

ENTRYPOINT ["/entrypoint_stage1.sh"]
