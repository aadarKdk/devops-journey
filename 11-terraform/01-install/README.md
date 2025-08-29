[Terraform GitHub Link](https://github.com/hashicorp/terraform)

[Install Terraform Docs](https://developer.hashicorp.com/terraform/install)

- To install on Ubuntu/Debian - apt package manager:
```
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

- After installation, Verify it:
```
vagrant@vagrant:~$ terraform -v
```
It shows versions like:
```
Terraform v1.13.1
on linux_amd64
```



