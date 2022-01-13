#!/bin/bash

bosh delete-env openvpn.yml \
  --vars-store creds/vpn-deploy-az3.yml \
  --state openvpn-state-az3.json \
  -o operations/init-openstack.yml \
  -o operations/vpn-pushed-routes.yml \
  -o operations/vpn-ssh.yml \
  -o operations/vpn-server-ops.yml \
  -o operations/vpn-client-ops.yml \
  -o operations/vpn-client-ops-add.yml \
  -o operations/vpn-multiple-client-connections.yml \
  -v server_key_pair="$( bosh int creds/vpn-server-az3.yml --path /server_key_pair )" \
  -v client_key_pair="$( bosh int creds/vpn-server-az2.yml --path /client_key_pair )" \
  -v client_key_pair_add="$( bosh int creds/vpn-server-az1.yml --path /client_key_pair )" \
  -l vars-az3.yml

