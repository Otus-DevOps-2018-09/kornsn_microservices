import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_hosts_file(host):
    f = host.file('/etc/hosts')

    assert f.exists
    assert f.user == 'root'
    assert f.group == 'root'


def test_service_is_running_and_enabled(host):
    service = host.service('docker')
    assert service.is_running
    assert service.is_enabled


def test_service_listens_port(host):
    assert host.socket('unix:///var/run/docker.sock').is_listening
