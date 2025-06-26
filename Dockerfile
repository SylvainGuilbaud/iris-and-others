ARG IMAGE
FROM $IMAGE

USER root

COPY cert /opt/cert 

RUN apt-get update && apt-get install -y \
    # openjdk-21-jdk \
	sudo && \
	/bin/echo -e ${ISC_PACKAGE_MGRUSER}\\tALL=\(ALL\)\\tNOPASSWD: ALL >> /etc/sudoers && \
	sudo -u ${ISC_PACKAGE_MGRUSER} sudo echo enabled passwordless sudo-ing for ${ISC_PACKAGE_MGRUSER} && \
    chmod -R +rx /opt/cert


USER ${ISC_PACKAGE_MGRUSER}
WORKDIR /home/irisowner/dev

ARG TARGETARCH ${TARGETARCH}

ENV PYTHON_PATH=/usr/irissys/bin/irispython
ENV SRC_PATH=/opt/irisapp
ENV IRISUSERNAME=SuperUser
ENV IRISPASSWORD=SYS
ENV IRISNAMESPACE=USER
# ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-arm64/
# ENV JRE_HOME=/usr/lib/jvm/java-21-openjdk-arm64/
# ENV CLASSPATH=.:/usr/irissys/dev/java/lib/1.8/*
# ENV PATH="/home/irisowner/iris_env/bin:/home/irisowner/.local/bin:/usr/irissys/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/irisowner/bin:${JAVA_HOME}/bin:${PATH}"
ENV PATH="/home/irisowner/iris_env/bin:/home/irisowner/.local/bin:/usr/irissys/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/irisowner/bin"

COPY keys/iris.key /usr/irissys/mgr/iris.key

RUN --mount=type=bind,src=.,dst=. \
    # export JAVA_HOME && \ 
    # export JRE_HOME && \
    # export CLASSPATH && \
    # python3 -m venv ~/py_envs && \
    # . ~/py_envs/bin/activate && \
    # pip3 install -r requirements.txt && \
    iris start IRIS && \
    iris session IRIS < iris-sys.script && \
    iris merge IRIS iris-merge.cpf && \
	iris session IRIS < iris-app.script && \
    iris stop IRIS quietly