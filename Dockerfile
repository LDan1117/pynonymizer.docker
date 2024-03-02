FROM python:3.10.5-slim-buster

# Install all required dependencies
RUN apt-get update \
    && apt-get install -y unixodbc unixodbc-dev gnupg2 curl \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && apt-get update \
    && curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql17 \
    && /usr/local/bin/python -m pip install --upgrade pip \
    && pip3 install pynonymizer pynonymizer[mssql]

WORKDIR /app

# Default pynonymizer arguments. They can be overridden via container arguments.
ENV PYNONYMIZER_INPUT=ignore
ENV PYNONYMIZER_OUTPUT=ignore
ENV PYNONYMIZER_VERBOSE=true
ENV PYNONYMIZER_ONLY_STEP=ANONYMIZE_DB
ENV PYNONYMIZER_DB_TYPE=mssql

COPY . .
COPY ./src ./src

ENTRYPOINT [ "/bin/sh",  "-c", "pynonymizer" ]
