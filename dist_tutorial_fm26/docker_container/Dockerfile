FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# Install XFCE desktop environment and TigerVNC server
# The GUI will be forwarded via VNC and made accessible through a web browser using noVNC
RUN apt update && apt install -y \
    xfce4 xfce4-terminal \
    thunar xdg-utils \
    evince \
    tigervnc-standalone-server tigervnc-common \
    xfonts-base xfonts-100dpi xfonts-75dpi \
    novnc websockify \
    openjdk-21-jre \
    wget xauth \
    nano less \
    libwebkit2gtk-4.0-37 \
    && apt clean

# Copy necessary artifacts
WORKDIR /artifact
COPY asmeta_linux_x86_64/ /artifact/asmeta_linux_x86_64/
COPY asmeta_linux64.sh /artifact/asmeta_linux64.sh
COPY License.txt /artifact/LICENSE.txt
COPY README.pdf /artifact/README.pdf
COPY entrypoint.sh /usr/local/bin/asmeta-entrypoint

# Make startup scripts executable and create a non-root user
RUN chmod +x /usr/local/bin/asmeta-entrypoint /artifact/asmeta_linux64.sh \
 && useradd -m -s /bin/bash asmeta \
 && chown -R asmeta:asmeta /artifact /home/asmeta

# Switch to the non-root user environment
ENV USER=asmeta LOGNAME=asmeta HOME=/home/asmeta
RUN echo "asmeta:asmeta" | chpasswd
USER asmeta
WORKDIR /home/asmeta

# Expose noVNC web interface port
EXPOSE 6080

# Launch the container startup script
ENTRYPOINT ["/usr/local/bin/asmeta-entrypoint"]