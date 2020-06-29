FROM fedora

ENV TMP_WORKSPACE_DIR /tmp/workspace

ENV PEPPER_FISH_THEME_ORIGIN_URL https://github.com/SLIB53/pepper-fish-theme.git
ENV PEPPER_FISH_THEME_DIR ${TMP_WORKSPACE_DIR}/github.com/slib53/pepper-fish-theme

# Install tools

# XXX: for rolling release, instruction defines a mutable layer
RUN dnf upgrade --assumeyes

RUN dnf install --assumeyes bat fish git htop neovim procps tree which

# Clone pepper-fish-theme

# XXX: for rolling release, instruction defines a mutable layer
RUN git clone --branch release-bloobox --single-branch \
${PEPPER_FISH_THEME_ORIGIN_URL} ${PEPPER_FISH_THEME_DIR}

# Configure fish shell

RUN mkdir -p /root/.config/fish/functions && \
echo 'set fish_greeting' > /root/.config/fish/functions/fish_greeting.fish

RUN cd ${PEPPER_FISH_THEME_DIR} && \
fish scripts/apply_theme.fish

# Cleanup

RUN rm -rf ${TMP_WORKSPACE_DIR}

# Configure

WORKDIR /home
CMD [ "fish" ]
