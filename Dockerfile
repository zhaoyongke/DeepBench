FROM nvcr.io/nvidia/tensorflow:22.09-tf1-py3

WORKDIR /research

RUN apt-get update

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    build-essential \
    git 

ENV HOME /research
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH


RUN apt-get install -y virtualenv htop

# Mount data into the docker
ADD . /research/deepbench


WORKDIR /research/deepbench

ENTRYPOINT ["/bin/bash"]

