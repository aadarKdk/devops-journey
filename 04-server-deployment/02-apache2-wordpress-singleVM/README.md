# WordPress Single VM Deployment with Vagrant

This project automates the deployment of a WordPress site on a single Ubuntu VM using Vagrant and provisioning scripts. It installs Apache, MySQL, PHP, and WordPress, configures the necessary services, and sets appropriate permissions.

---

## Steps Followed and File Descriptions

- **Provisioning Scripts:**

  - `wordpress_setup.sh`: Installs Apache, MySQL, PHP, required PHP modules, downloads WordPress, sets up directory permissions, copies Apache site configuration, enables required modules/sites, restarts Apache, and runs the database and WordPress config scripts.

  - `db_config.sh`: Creates the MySQL database and user required for WordPress.

  - `wp_config.sh`: Configures the WordPress installation to connect to the database by generating `wp-config.php`.

- **Configuration Files:**

  - `wordpress.conf`: Apache virtual host configuration file for serving WordPress, enabling URL rewriting and pointing to the WordPress directory.

- **Shared Folder:**

  - `/vagrant`: Default synced folder between host and guest VM, containing all provisioning scripts and configuration files.

- **WordPress Directory:**

  - `/srv/www/wordpress`: Location where WordPress files are installed and served by Apache.

---

## How to Use

1. Clone or download this project repository.

2. Navigate into the project directory:
   ```bash 
   cd 04-server-deployment/02-apache2-wordpress-singleVM
   ```
3. Start and provision the VM by running:
```bash
    vagrant up
```
4. After provisioning completes, open your web browser and visit the WordPress site:
```bash
    http://192.168.56.10/
```
5. To access the WordPress administration panel, open:
```bash
    http://192.168.56.10/wp-login.php
```
6. To connect to the VM via SSH, run:
```bash
vagrant ssh
```
7. If you modify any provisioning scripts or configuration files inside the /vagrant folder, apply changes by reloading and reprovisioning the VM:
```bash
vagrant reload --provision
```






## Reference
This project follows and adapts the official Ubuntu tutorial for WordPress installation and configuration:
[Install and configure WordPress on Ubuntu](https://ubuntu.com/tutorials/install-and-configure-wordpress#1-overview)


## Known Issues

- WordPress installation completes successfully, but login to the admin panel (`/wp-login.php`) might fail or redirect unexpectedly.
