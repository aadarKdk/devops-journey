## Apache Tomcat as a systemd Service

This guide documents how to run Apache Tomcat as a `systemd` service on a Linux VM using Java, Maven, and automatically run a WAR-based web application.

---
### Prerequisites

- Java (OpenJDK 21)
- Apache Tomcat 11.0
- Maven (for building WAR)
- A Java web application (Maven project)
- Ubuntu or Debian-based Linux (tested on Vagrant VM)

---

#### Develop the app and run command(to build the WAR file) :
```bash
mvn clean package
```
#### Install Tomcat
```bash
wget https://downloads.apache.org/tomcat/tomcat-11/v11.0.9/bin/apache-tomcat-11.0.9.tar.gz
tar -xvzf apache-tomcat-11.0.9.tar.gz
mv apache-tomcat-11.0.9 tomcat
```
#### Deploy WAR (Copy WAR file into the Tomcat webapps directory) :
```bash
cp target/java-tomcat-maven-example.war ~/maven_CICD/tomcat/webapps/
```
#### Create systemd Service named [tomcat.service](https://github.com/erkdk/devops-journey/blob/main/07-systemd/tomcat.service)

#### Run the following commands:
```bash
sudo systemctl daemon-reexec       # sudo systemctl daemon-reload
sudo systemctl enable tomcat
sudo systemctl start tomcat
sudo systemctl status tomcat

```
#### Output:
![tomcat.service](https://github.com/erkdk/devops-journey/blob/main/07-systemd/tomcat-service.png)

#### Recommended Reading:
- Wikipedia **[systemd](https://en.wikipedia.org/wiki/Systemd)**
- **[systemd.io](https://systemd.io/)**
- Linode guide **[start-service-at-boot](https://www.linode.com/docs/guides/start-service-at-boot/)**
- **[systemd-wiki](https://www.freedesktop.org/wiki/Software/systemd/)**
- **[manual](https://man7.org/linux/man-pages/man1/init.1.html)**


####  Best Practices:
- Run the service as a non-root user
- Check Catalina.out for error finding
