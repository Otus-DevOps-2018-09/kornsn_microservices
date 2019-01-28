## How to deploy Gitlab-CI

1. Create VM with terraform 
```bash
cd terraform
terraform init
terraform apply
```

2. Go to ansible dir

3. Install docker and pip
```bash
ansible-playbook playbooks/prepare.yml
```

4. Run Gitlab-CI inside docker container
```bash
ansible-playbook playbook/gitlab_in_docker.yml
```

5. Run Gitlab-runner inside docker container
```bash
ansible-playbook playbooks/runner_in_docker.yml
```

6. Create project

7. Take registration token and register runner
```bash
cp vars.example vars.yml
```
Write your token and desired runner name into vars.yml file and run playbook
```bash
ansible-playbook playbooks/register.yml
```

Your Gitlab is ready now!

8. There are some more playbook for runners control:

- list.yml -- list all registered runners;
- unregister -- unregister runners. Pass extra-var `-e token=<runner-token>`. You can get runner token from `list` playbook output.
