FROM fedora:41

WORKDIR /root

CMD [ "fish" ]

# Install Base Packages

# WARNING: Instruction defines an inconsistent layer for rolling release.
RUN dnf upgrade --assumeyes \
    && dnf install --assumeyes bat eza fish git-core ncurses unzip which zip \
    && dnf clean all -y


# Configure

## Configure User

RUN usermod --shell /bin/fish root

### Configure Shell

RUN mkdir -p /root/.config/fish/functions \
    && echo 'set fish_greeting' >/root/.config/fish/functions/fish_greeting.fish

# WARNING: Instruction defines an inconsistent layer for rolling release.
RUN PEPPER_GIT_URL=https://github.com/SLIB53/pepper-fish-theme.git \
    && PEPPER_WORKING_COPY_DIR=/tmp/workspace/github.com/slib53/pepper-fish-theme \
    && git clone --branch release-bloobox --single-branch ${PEPPER_GIT_URL} ${PEPPER_WORKING_COPY_DIR} \
    && cd ${PEPPER_WORKING_COPY_DIR} && fish scripts/apply_theme.fish


# Clean Up

RUN rm -rf /tmp/workspace
