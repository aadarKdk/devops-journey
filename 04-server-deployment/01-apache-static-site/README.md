# Apache Static Website Deployment using Vagrant

This project provisions a local Apache web server on Ubuntu 24.04 using Vagrant and Shell provisioning. A static HTML template (“Mini Finance Site”) is downloaded and hosted automatically.

## ✅ Prerequisites

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)
- Internet connection (to download the website template)

### Screenshorts from Apache2 ubuntu default page:
![Configure Overview](https://github.com/aadaRkdk/devops-journey/blob/main/04-server-deployment/01-apache-static-site/Configure_overview.png)

![Documents Roots](https://github.com/aadaRkdk/devops-journey/blob/main/04-server-deployment/01-apache-static-site/Documents_roots.png)


## 📁 File Descriptions

| File Name                  | Purpose |
|---------------------------|---------|
| `Vagrantfile`             | Defines the virtual machine, sets up a private IP, and provisions the server with the shell script. |
| `miniFinanceSite_setup.sh`| Shell script executed during provisioning. Installs Apache, downloads and extracts the website, sets permissions, and configures Apache. |
| `mini_finance.conf`       | Apache Virtual Host configuration file that defines how the site will be served. |
| `README.md`               | Documentation of the project. |

## 🌐 Website Access

After provisioning with `vagrant up`, access the static site at: http://192.168.56.20


