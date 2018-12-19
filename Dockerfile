FROM fluent/fluentd:stable
RUN apk add --update --virtual .build-deps \
    sudo build-base ruby-dev \
    && sudo gem install \
    fluent-plugin-concat \
    fluent-plugin-logzio \
    fluent-plugin-record-reformer \
    fluent-plugin-record-modifier \
    fluent-plugin-docker_metadata_filter \
    fluent-plugin-ecs-metadata-filter \
    fluent-plugin-detect-exceptions \
    && sudo gem sources --clear-all \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* \
    /home/fluent/.gem/ruby/2.3.0/cache/*.gem
COPY fluent.conf /fluentd/etc/fluent.conf
#COPY fluent-plugin-detect-exceptions/fluent-plugin-detect-exceptions-0.0.9.gem /
#RUN gem install /fluent-plugin-detect-exceptions-0.0.9.gem
COPY entrypoint.sh /bin/entrypoint.sh
CMD fluentd -vv -c /fluentd/etc/${FLUENTD_CONF} $FLUENTD_OPT
