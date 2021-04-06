#!/bin/bash

set -e

mkdir -p $AIRFLOW_HOME/dags && mkdir -p $AIRFLOW_HOME/logs

if [[ -n $AIRFLOW__CORE__SQL_ALCHEMY_CONN ]] && [[ $AIRFLOW_CMD =~ ^(webserver|scheduler|worker)$ ]]; then
  echo ' ---> Initializing airflow database...'
  airflow db init || true
fi

echo " ---> Starting airflow $AIRFLOW_CMD ..."
airflow $AIRFLOW_CMD