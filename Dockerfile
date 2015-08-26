FROM robxu9/openmandriva:2014.0

RUN urpmi --auto --auto-update
RUN urpmi --auto smart gettext

# This is needed because smart still depends on this...
RUN echo "ZONE=Etc/UTC" | tee -a /etc/sysconfig/clock

ADD assets /assets
ADD repocheck /repocheck
RUN chmod +x /repocheck
ADD repocheck.conf /repocheck.conf

VOLUME ["/data"]

ENTRYPOINT ["/repocheck"]
