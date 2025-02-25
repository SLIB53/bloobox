FROM quay.io/fedora/fedora

# Install Base Packages

# WARNING: Instruction defines an inconsistent layer for rolling release.
RUN dnf upgrade --assumeyes \
    && dnf install --assumeyes bat eza fish git-core ncurses procps which \
    && dnf install --assumeyes openssh-server \
    && dnf clean all --assumeyes


# Configure Userspace

## Configure systemd

RUN systemctl enable sshd.service


## Configure Users

RUN useradd --create-home --shell /usr/bin/fish bloo --groups wheel \
    && echo 'bloo' | passwd --stdin bloo


### Configure Shell

USER bloo

RUN mkdir -p /home/bloo/.config/fish/functions \
    && echo 'set fish_greeting' >/home/bloo/.config/fish/functions/fish_greeting.fish

COPY <<EOF /home/bloo/.config/fish/config.fish
if status is-interactive
    alias sl eza
    alias sla 'eza -la'
    alias slr 'eza --tree'
end
EOF

# WARNING: Instruction defines an inconsistent layer for rolling release.
RUN PEPPER_GIT_URL=https://github.com/SLIB53/pepper-fish-theme.git \
    && PEPPER_WORKING_COPY_DIR=/tmp/workspace/github.com/slib53/pepper-fish-theme \
    && git clone --branch release-bloobox --single-branch ${PEPPER_GIT_URL} ${PEPPER_WORKING_COPY_DIR} \
    && cd ${PEPPER_WORKING_COPY_DIR} && fish scripts/apply_theme.fish


# Clean Up

USER root

RUN rm -rf /tmp/workspace


# Configure Container

USER bloo

WORKDIR /home/bloo

ENTRYPOINT [ "/usr/bin/fish", "-c" ]
CMD [ "fish" ]
