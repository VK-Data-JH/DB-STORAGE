FROM postgres:17
ARG JMENO="aas_dwh_storage_db"
ARG PORT1="1114"
# ARG PORT2="1433"
ARG NETLINK="ambica_aas"
# Change workdir and create csvdata dir with permissions
WORKDIR /var/lib/postgresql
RUN mkdir csvdata \
    && chmod 700 csvdata
ENV POSTGRES_USER=postgres \
    POSTGRES_PASSWORD=postgres \
    LANG=en_US.UTF-8 \
    TZ=Europe/Prague
RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get autoremove \
    && apt-get install -y locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i cs_CZ -c -f UTF-8 -A /usr/share/locale/locale.alias cs_CZ.UTF-8
# Prohibit non-SSL connections
RUN sed -i 's/host all all all/hostssl all all all/g' /usr/local/bin/docker-entrypoint.sh
EXPOSE 5432
