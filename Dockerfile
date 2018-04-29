FROM gcc:latest

# Install gdb
RUN \
    apt-get update; \
    apt-get install -y -qq gdb gdbserver; \
    \
    echo 'set startup-with-shell off' >> ~/.gdbinit; \
    echo 'set disassembly-flavor intel' >> ~/.gdbinit; \
    \
    rm -r /var/lib/apt/lists/*; \
    apt-get purge -y --auto-remove $buildDeps

# create working dir
RUN mkdir -p /app
WORKDIR /app

# expose default gdbserver port
EXPOSE 2345

COPY entrypoint /usr/local/bin
ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["gdb"]