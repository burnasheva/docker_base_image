FROM centos:6

RUN (echo ; \
     echo "group_package_types=mandatory";) >> /etc/yum.conf \
 && yum -y update \
 && yum -y groupinstall "Development Tools" \
 && yum clean all

RUN yum -y update \
 && yum -y install \
      centos-release-scl \
 && yum clean all

RUN yum -y install python27 \
 && yum clean all


ENTRYPOINT ["scl", "enable", "python27", "--" "bash"]
