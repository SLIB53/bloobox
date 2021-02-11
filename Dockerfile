FROM fedora

# Install Base Setup

RUN dnf install --assumeyes bat fish git procps tree unzip which zip

RUN mkdir -p /root/.config/fish/functions &&
    echo 'set fish_greeting' >/root/.config/fish/functions/fish_greeting.fish

# Upgrade to Latest Software

# DIRTY: for rolling release, instruction defines an inconsistent layer
RUN dnf upgrade --assumeyes

## install latest custom fish theme

# DIRTY: for rolling release, instruction defines an inconsistent layer
RUN git clone --branch release-bloobox --single-branch https://github.com/SLIB53/pepper-fish-theme.git /tmp/workspace/github.com/slib53/pepper-fish-theme &&
    cd /tmp/workspace/github.com/slib53/pepper-fish-theme && fish scripts/apply_theme.fish

# Clean Up

RUN rm -rf /tmp/workspace

# Configure

WORKDIR /home
CMD [ "fish" ]
