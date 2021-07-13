FROM centos:8

RUN dnf -y install "https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm";
RUN dnf -y install epel-release
RUN dnf -y install \
		# libicu is required by postgresql13
		libicu \
		# libicu-devel, clang-devel, and llvm-devel are required by postgresql13-devel
		libicu-devel clang-devel llvm-devel
RUN dnf -y --repo=pgdg13 -- install postgresql13 postgresql13-devel
RUN dnf -y --enablerepo=powertools install \
		bind-utils           \
		gettext              \
		git                  \
		# ip commands is used in set-to-ips-from-dns.sh
		iproute              \
		isomd5sum            \
		jq                   \
		net-tools            \
		nmap-ncat            \
		openssl              \
		# rsync is used to copy certs in "Shared SSL certificate generation" step
		rsync                \

		# Traffic Ops dependencies (Not all needed for CDN in a Box, but all
		# required by the Traffic Ops RPM)
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
		perl-WWW-Curl;       \
	dnf clean all

EXPOSE 443
WORKDIR /opt/traffic_ops/app

COPY traffic_ops.rpm /traffic_ops.rpm
RUN rpm -Uvh /traffic_ops.rpm && \
	rm /traffic_ops.rpm

COPY run.sh /run.sh
CMD /run.sh