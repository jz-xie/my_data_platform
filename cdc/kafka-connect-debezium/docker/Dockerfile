# Doc: https://strimzi.io/docs/operators/latest/overview#configuration-points-connect_str

FROM quay.io/strimzi/kafka:0.43.0-kafka-3.8.0
USER root:root

ENV PLUGIN_PATH="/opt/kafka/plugins/"

RUN mkdir ${PLUGIN_PATH}

# Install MySQL Connector plugin: https://debezium.io/releases/2.5/#installation
RUN curl -k "https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/2.5.2.Final/debezium-connector-mysql-2.5.2.Final-plugin.tar.gz" | tar xvzf - -C ${PLUGIN_PATH}

# # Install IAM Authentication Plugin
# RUN curl -kL "https://github.com/aws/aws-msk-iam-auth/releases/download/v2.0.3/aws-msk-iam-auth-2.0.3-all.jar" -o "/opt/kafka/libs/aws-msk-iam-auth.jar"

# # Modify strimzi config to enable IAM authentication https://github.com/strimzi/strimzi-kafka-operator/issues/5473
# COPY kafka_iam_config /opt/kafka/
# RUN chmod +x /opt/kafka/kafka_connect_config_generator.sh \
#  && chmod +x /opt/kafka/kafka_mirror_maker_2_connector_config_generator.sh \
#  && chmod +x /opt/kafka/kafka_mirror_maker_consumer_config_generator.sh \
#  && chmod +x /opt/kafka/kafka_mirror_maker_producer_config_generator.sh

USER 1001