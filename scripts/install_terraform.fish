mkdir -p /tmp/install-terraform

cd /tmp/install-terraform

begin
    echo "Resolving version..."

    set --local arch $(uname -m)

    if [ "$arch" = aarch64 ]
        set --global APP_DOWNLOAD_URL https://releases.hashicorp.com/terraform/1.3.5/terraform_1.3.5_linux_arm64.zip
    else if [ "$arch" = x86_64 ]
        set --global APP_DOWNLOAD_URL https://releases.hashicorp.com/terraform/1.3.5/terraform_1.3.5_linux_amd64.zip
    else
        echo "Unsupported architecture: $arch"
        exit 1
    end
end

begin
    echo "Downloading app from $APP_DOWNLOAD_URL..."

    curl $APP_DOWNLOAD_URL \
        -o terraform.zip

    unzip terraform.zip

    mv terraform /usr/local/bin
end
