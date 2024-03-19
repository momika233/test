#!/bin/bash
curl -kfsSL 'http://collie-agent-hk.chaitin.com:1443/api/v1/host/install_script?node=2&os_type=linux' | sudo bash -s -- --token=aedd6797a88a77276433193d9f02fbaf
