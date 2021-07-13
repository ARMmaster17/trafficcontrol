FROM centos:8

RUN dnf -y install epel-release
RUN dnf -y install --enable-repo=powertools \
        cpanminus            \
		expat-devel          \
		gcc-c++              \
		golang               \
		libcap               \
		libcurl-devel        \
		libidn-devel         \
		libpcap-devel        \
		mkisofs              \
		openssl-devel        \
		perl-core            \
		perl-Crypt-ScryptKDF \
		perl-DBD-Pg          \
		perl-DBI             \
		perl-Digest-SHA1     \
		perl-JSON            \
		perl-libwww-perl     \
		perl-TermReadKey     \
		perl-Test-CPAN-Meta  \
		perl-WWW-Curl

EXPOSE 443
WORKDIR /opt/traffic_ops/app
