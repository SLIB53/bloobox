FROM fedora

ARG PEPPER_GIT_URL

# Install Base Setup

# DIRTY: for rolling release, instruction defines an inconsistent layer
RUN dnf upgrade --assumeyes \
    && dnf install --assumeyes bat fish git procps tree unzip which zip \
    && dnf clean all -y

## Configure Fish Shell

RUN mkdir -p /root/.config/fish/functions \
    && echo 'set fish_greeting' >/root/.config/fish/functions/fish_greeting.fish

# DIRTY: for rolling release, instruction defines an inconsistent layer
RUN PEPPER_WORKING_COPY_DIR=/tmp/workspace/github.com/slib53/pepper-fish-theme \
    && git clone --branch release-bloobox --single-branch ${PEPPER_GIT_URL} ${PEPPER_WORKING_COPY_DIR} \
    && cd ${PEPPER_WORKING_COPY_DIR} && fish scripts/apply_theme.fish

# Clean Up

RUN rm -rf /tmp/workspace

# Configure

WORKDIR /root

CMD [ "fish" ]
