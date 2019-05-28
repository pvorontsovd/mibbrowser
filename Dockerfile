FROM anapsix/alpine-java

RUN apk add --no-cache unzip libxext libxrender libxtst libxi \
    && adduser -D mib \
    && su mib -c "cd \
    && wget http://www.ireasoning.com/download/mibfree/mibbrowser.zip \
    && unzip mibbrowser.zip \
    && rm -rf mibbrowser.zip" \
    && apk del unzip

ENTRYPOINT [ "su", "mib", "-c", "/home/mib/ireasoning/mibbrowser/browser.sh" ]
