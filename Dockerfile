FROM amazonlinux:2
RUN yum update -y && \
    yum install -y \
    curl \
    unzip \
    git \
    zsh \
    gcc \
    make \
    && yum clean all \
    && rm -rf /var/cache/yum

WORKDIR /root
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    /root/aws/install && \
    rm -rf aws awscliv2.zip

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY ./.zshrc .

WORKDIR /code
CMD [ "/bin/zsh" ]
