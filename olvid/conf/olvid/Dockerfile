FROM registry.access.redhat.com/ubi8-minimal AS build-env

ENV KEYCLOAK_VERSION keycloak_olvid
ARG KEYCLOAK_DIST=keycloak*.tar.gz

RUN microdnf install -y tar gzip curl
RUN cd /tmp/
RUN mkdir keycloak
RUN curl -o /tmp/keycloak/keycloak_olvid.tar.gz https://olvid.io/keycloak_olvid_21.1.1_3.0.1.tar.gz

RUN mv /tmp/keycloak/keycloak_olvid* /opt/keycloak && mkdir -p /opt/keycloak/data
RUN chmod -R g+rwX /opt/keycloak


FROM registry.access.redhat.com/ubi8-minimal
ENV LANG en_US.UTF-8

COPY --from=build-env --chown=1000:0 /opt/keycloak /opt/keycloak
RUN chmod 777 /opt/keycloak/bin/kc.sh

RUN microdnf update -y && \
    microdnf install -y --nodocs java-17-openjdk-headless glibc-langpack-en && microdnf clean all && rm -rf /var/cache/yum/* && \
    echo "keycloak:x:0:root" >> /etc/group && \
    echo "keycloak:x:1000:0:keycloak user:/opt/keycloak:/sbin/nologin" >> /etc/passwd

USER 1000

EXPOSE 8080

ENTRYPOINT [ "/opt/keycloak/bin/kc.sh" ]