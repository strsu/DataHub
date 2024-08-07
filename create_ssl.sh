#!/bin/bash

# 디렉토리 설정
CERTDIR="./nginx/ssl"

# 디렉토리 생성
mkdir -p ${CERTDIR}

# OpenSSL로 SSL 인증서 및 키 생성
openssl genpkey -algorithm RSA -out ${CERTDIR}/private.key -pkeyopt rsa_keygen_bits:2048
openssl req -new -key ${CERTDIR}/private.key -out ${CERTDIR}/cert.csr -subj "/C=KR/ST=YourState/L=YourCity/O=YourOrganization/OU=YourUnit/CN=localhost/emailAddress=your-email@example.com"
openssl x509 -req -days 365 -in ${CERTDIR}/cert.csr -signkey ${CERTDIR}/private.key -out ${CERTDIR}/public.crt

