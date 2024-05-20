#!/usr/bin/env bash

ADDEMPTY=false

if [ "$1" == "--add-empty" ]; then
    ADDEMPTY=true
    shift
fi

set -e # exit if errors
# set -x

exdir=$(dirname $(readlink -f "$0"))

source $exdir/cert-parameters

DURATION_DAYS=36500 # 100 years

if [ "$1" == "" ] && ! $ADDEMPTY; then
    echo "$0 [--add-empty] [NAME]*"
    echo "specify name of domains ( ie. "some some2" will generate some.$DOMAIN, some2.$DOMAIN )"
    exit
fi

rootcadir=~/sscerts
mkdir -p $rootcadir
chmod 700 $rootcadir

ROOT_CA_KEY=$rootcadir/${DOMAIN}_CA.key
ROOT_CA_CRT=$rootcadir/${DOMAIN}_CA.crt

FQDN=$1.$DOMAIN
if [ "$1" == "" ] && $ADDEMPTY; then
    FQDN=$DOMAIN
fi
outdir=$rootcadir/$FQDN
mkdir -p $outdir

PRIVATE_KEY=$outdir/$FQDN.key
CSR_CONF=$outdir/$FQDN.csr.conf
CSR=$outdir/$FQDN.csr
CRT_CONF=$outdir/$FQDN.crt.conf
CRT=$outdir/$FQDN.crt

# Generate Private key 

openssl genrsa \
    -out $PRIVATE_KEY \
    2048

# args: appendfile dns1 dns2 ...
function append_dns_vars() {

    set +e    
    
    let k=1    

    if $ADDEMPTY; then 
        echo "DNS.$k = $DOMAIN" >> $1
        let k=$k+1
    fi

    for i in ${@:2}; do        
        echo "DNS.$k = $i.$DOMAIN" >> $1
        let k=$k+1
    done    

    set -e

}

# Create csr conf

cat > $CSR_CONF <<EOF
[ req ]
default_bits = 2048
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[ dn ]
C = $COUNTRY
ST = $STATE
L = $CITY
O = $ORGNAME
OU = $ORGUNIT
CN = $FQDN

[ req_ext ]
subjectAltName = @alt_names

[ alt_names ]
EOF

append_dns_vars $CSR_CONF $@

# IP.1 = 10.10.1.4
# IP.2 = 10.10.1.5

# create CSR request using private key

openssl req \
    -new \
    -key $PRIVATE_KEY \
    -out $CSR \
    -config $CSR_CONF

# Create config file for the certificate

cat > $CRT_CONF <<EOF

authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
EOF

append_dns_vars $CRT_CONF $@

# Create SSl with self signed CA

openssl x509 -req \
    -in $CSR \
    -CA $ROOT_CA_CRT \
    -CAkey $ROOT_CA_KEY \
    -CAcreateserial \
    -out $CRT \
    -days $DURATION_DAYS \
    -sha256 \
    -extfile $CRT_CONF

# echo "$log" | tee "$LOGFILE"
