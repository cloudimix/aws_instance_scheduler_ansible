#!/usr/bin/env bash

.SILENT: infra cron all

.PHONY: id_rsa
id_rsa:
	ansible-playbook id_rsa_generating.yaml

.PHONY: infra
infra:
	terraform init
	terraform apply

.PHONY: cron
cron:
	ansible-galaxy install -r requirements.yaml
	ansible-playbook -i dynamic_inventory.py cron_playbook.yaml --ssh-common-args='-o StrictHostKeyChecking=no' -vv
	echo "------DONE------"

.PHONY: test
test:

.PHONY: clean
clean:

.PHONY: all
all: infra cron
