# Use Ubuntu as the base image
FROM arm64v8/ubuntu:20.04

# Set non-interactive environment
ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0

# Install dependencies
RUN apt-get update && apt-get install -y \
    dosbox \
    xvfb \
    x11vnc \
    wget \
    curl \
    git \
    python3 \
    python3-pip && \
    apt-get clean

# Install websockify
RUN pip3 install websockify

# Set up noVNC (browser-based VNC client)
RUN git clone https://github.com/novnc/noVNC.git /opt/novnc && \
    chmod -R +x /opt/novnc/utils

# Set the working directory
WORKDIR /QB45

# Copy QBasic files into the container
COPY QB45/ .

# DOSBox configuration
RUN mkdir -p /root/.dosbox && \
    dosbox -version > /dev/null && \
    version=$(dosbox -version | grep -oP '0\.\d{2}-\d') && \
    config_file="/root/.dosbox/dosbox-${version}.conf" && \
    dosbox -printconf > "$config_file" && \
    sed -i 's/^output=.*/output=opengl/' "$config_file" && \
    sed -i 's/^fullscreen=.*/fullscreen=true/' "$config_file" && \
    sed -i 's/^fullresolution=.*/fullresolution=desktop/' "$config_file" && \
    sed -i 's/^# autoexec.*/[autoexec]/' "$config_file" && \
    sed -i 's/^nosound=.*/nosound=true/' "$config_file" && \
    sed -i 's/^mididevice=.*/mididevice=none/' "$config_file" && \
    echo "[autoexec]" >> "$config_file" && \
    echo "mount c /QB45" >> "$config_file" && \
    echo "c:" >> "$config_file" && \
    echo "keyb sf" >> "$config_file" && \
    echo "QB" >> "$config_file" && \
    echo "exit" >> "$config_file"

# Set a default password for x11vnc
RUN mkdir -p /root/.vnc && \
    x11vnc -storepasswd "password" /root/.vnc/passwd

# Copy the startup script
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

# Expose port for VNC and web access
EXPOSE 8082

# Use CMD to start services via the startup script
CMD ["/usr/local/bin/startup.sh"]
