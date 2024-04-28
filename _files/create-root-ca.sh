#!/usr/bin/env bash

set -e # exit if errors

exdir=$(dirname $(readlink -f "$0"))

source $exdir/cert-parameters

rootcadir=~/sscerts

mkdir -p $rootcadir
chmod 700 $rootcadir

ROOT_CA_KEY=$rootcadir/${DOMAIN}_CA.key
ROOT_CA_CRT=$rootcadir/${DOMAIN}_CA.crt

# Create root CA & Private key

openssl req -x509 \
    -sha256 \
    -days $DURATION_DAYS \
    -nodes \
    -newkey rsa:2048 \
    -subj /CN=$DOMAIN/C=$COUNTRY/L=$CITY \
    -keyout $ROOT_CA_KEY \
    -out $ROOT_CA_CRT
