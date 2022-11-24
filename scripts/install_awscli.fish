mkdir -p /tmp/install-awscli

cd /tmp/install-awscli

begin
    echo "Resolving version..."

    set --local arch $(uname -m)

    if [ "$arch" = aarch64 ]
        set --global APP_DOWNLOAD_URL https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip
    else if [ "$arch" = x86_64 ]
        set --global APP_DOWNLOAD_URL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
    else
        echo "Unsupported architecture: $arch"
        exit 1
    end
end

begin
    echo "Downloading from $APP_DOWNLOAD_URL..."

    curl $APP_DOWNLOAD_URL \
        -o awscli.zip

    unzip awscli.zip

    ./aws/install
end
