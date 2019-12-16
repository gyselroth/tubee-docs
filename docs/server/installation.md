# Deploy Server

This is a step-by-step tutorial how to correctly deploy the tubee server.

There are multiple supported ways to deploy tubee:

* Docker (docker-compose)
* Container orchestration plattform like [Kubernetes](https://kubernetes.io/docs/concepts/overview/what-is-kubernetes/))
* helm
* Manually as tar archive
* Compile manually from source

The docker deployment using docker-compose or a container orchestration platform like kubernetes is the **recommended** way to deploy tubee. And it is also the simplest way.
Deploy tubee using debian packages, tar archives or even installing from source requires some advanced system knowledge.

## Docker (docker-compose)

The easiest, fastest and recommended way to deploy a tubee environment is to spin it up using docker and docker-compose.
Since the installation is not the same for different host os and docker can be started on Linux, Windows and Mac please visit 
the docker documentation on how to install [docker](https://docs.docker.com/install) and [docker-compose](https://docs.docker.com/compose/install).

**Requirements**:
* docker
* docker-compose
* curl
```


```
mkdir tubee; cd tubee
curl https://raw.githubusercontent.com/gyselroth/tubee/master/packaging/docker-compose/docker-compose.yaml > docker-compose.yaml
docker-compose up
```

>**Note** All tubee containers provide a version tag besides `latest`. It is best practice to use an exact version of a service instead the latest tag in production environment.
The containers provide a `latest-unstable` tag for the tubee-jobs, tubee and tubee-web container. It is in no way reccomened to use pre-releases in production environments! 
If you want to install beta and alpha versions replace `latest` with `latest-unstable` or specify an exact version tag. Pre-releases are only ment for testing purposes and are in no way recommended in production environements!

The default user is:<br/>
Username: admin <br/>
Password: admin <br/>


## Using the tar archive
Instead a deb package you may also use a tar archive and install tubee manually on your system. 
A tar archive is an already builded relase, you you just need to have all requirements installed on your system, you may have a look at [Manually install from source](#manually-install-from-source).

## Deploy on kubernetes (helm)

See helm

## Manually install from source

This topic is only for advanced users or developers and describes how to deploy tubee by installing from source.
If you are a developer please also continue reading [this](https://github.com/gyselroth/tubee/blob/master/CONTRIBUTING.md) article.

**Requirements**:

* posix based operating system (Basically every linux/unix)
* make
* [comoser](https://getcomposer.org/download/)
* git
* php >= 7.2
* php ext-mongodb
* php ext-curl
* php ext-mbstring
* php ext-posix
* php ext-pnctl
* php ext-apcu
* php ext-sysvmsg

**Optional requirements**:

* php ext-imagick (If you want to use The ImageEndpoint)
* php ext-ldap (If you want to use LDAP authentication and/or the LdapEndpoint)
* php ext-smb (If you want to use the SmbStorage)
* php ext-xml (If you want to use the XmlEndpoint)
* php ext-pdo (If you want to use the PdoEndpoint)
* php ext-mysql (If you want ot use the MysqlEndpoint)

This will only install the tubee server. Dependencies such as MongoDB do not get installed.
You can install those dependencies either by using distributed packages, see [Debian based distribution](#debian-based-distribution) or by installing them seperately from source.

### Install tubee server
```sh
git clone https://github.com/gyselroth/tubee.git
cd tubee
make install
```

>**Note** You can also create .deb or .tar packages using make. Just execute either `make deb` or `make tar` or `make dist` for both.
