FROM jupyter/tensorflow-notebook

ARG work_dir="/home/jovyan"
WORKDIR ${work_dir}

USER root
RUN apt-get update && apt-get install -y \
    build-essential \
    graphviz-dev \
    graphviz \
    pkg-config \
 && rm -rf /var/lib/apt/lists/*

USER jovyan
#RUN pip install --upgrade pip
RUN pip install pip==9.0.1
RUN pip install graphviz pydotplus jupyter_contrib_nbextensions
#COPY ./requirements.txt ${work_dir}/requirements.txt
#RUN pip install -r ${work_dir}/requirements.txt

# Set up Jupyter Notebook config
RUN ipython profile create
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable codefolding/main
RUN jupyter contrib nbextensions migrate
COPY .jupyter/custom ${work_dir}/.jupyter/custom
COPY .jupyter/nbconfig ${work_dir}/.jupyter/nbconfig
COPY .jupyter/jupyter_notebook_config.py ${work_dir}/.jupyter
COPY .ipython/profile_default/ipython_config.py ${work_dir}/.ipython/profile_default/ipython_config.py
ENV CONFIG ${work_dir}/.jupyter/jupyter_notebook_config.py
ENV CONFIG_IPYTHON ${work_dir}/.ipython/profile_default/ipython_config.py
