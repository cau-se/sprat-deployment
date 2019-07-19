#!/bin/bash

rm -rf gen
ansible-playbook backend/openstack_start.playbook
ansible-playbook -i gen/payload_ansible_hosts init_master.playbook

./gen/run_cloud_playbook.sh

ansible-playbook -i gen/payload_ansible_hosts gather_results.playbook
ansible-playbook backend/openstack_stop.playbook

