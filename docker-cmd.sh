#!/usr/bin/env bash

args=$@

if [ ! -z "${WSDD_ARGS}" ]; then
  args+=${WSDD_ARGS}
else
	if [ ! -z "${HOSTNAME}" ]; then
		args+="-n $HOSTNAME "
	elif [[ ! $args =~ [[:space:]^]-n[=[:space:]][[:alnum:]]+[[:space:]$] ]]
		echo "HOSTNAME environment variable must be set."
		exit 1
	fi

	if  [ ! -z "${WORKGROUP}" ]; then
		args+="-w $WORKGROUP "
	fi

	if  [ ! -z "${DOMAIN}" ]; then
		args+="-d $DOMAIN "
	fi
fi

exec python3 wsdd.py ${args}
