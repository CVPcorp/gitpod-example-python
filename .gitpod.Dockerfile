FROM gitpod/workspace-full

ARG USER=gitpod

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh
RUN sh Mambaforge-$(uname)-$(uname -m).sh -b -p /home/$USER/mambaforge
RUN rm Mambaforge-$(uname)-$(uname -m).sh

ENV PATH=/home/$USER/mambaforge/bin:$PATH

RUN mamba install -y -p /home/$USER/mambaforge -c conda-forge pandas numpy scikit-learn tensorflow catboost requests spacy pytorch cudatoolkit=10.1 pyhive cython dask shap
RUN pip install pycaret simpletransformers eif autokeras
