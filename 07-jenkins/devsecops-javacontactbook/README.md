
# [devsecops-javacontactbook](https://github.com/erkdk/devsecops-javacontactbook/tree/initial-setup)

A CI/CD pipeline implementation,  ContactBook Java WAR-based application  [java-contactbook-app](https://github.com/erkdk/java-contactbook-app) deployed on a **Docker Swarm cluster**.

| Tool        | Purpose                                     |
|-------------|---------------------------------------------|
| Jenkins     | CI/CD automation                            |
| Maven       | Build tool for Java WAR packaging           |
| Docker      | Containerization                            |
| Docker Swarm| Container orchestration                     |
| Harbor      | Private image registry                      |
| Trivy       | Image vulnerability scanner                 |
| Tomcat      | Application server                          |
| GitHub      | Source code management                      |
| Vagrant     | VM provisioning                             |
| Portainer   | Swarm GUI management                        |

This project demonstrates a basic real-world DevSecOps practices by deploying containerized services in a Swarm cluster environment.

---

### 📁 Project Structure
```bash
devsecops-javacontactbook
├── src/                # Source code (Java)
├── target/             # Compiled classes and packaged WAR (generated)
├── Dockerfile          # Docker build configuration for the app
├── docker-stack.yml    # Docker Swarm deployment file
├── Jenkinsfile         # CI/CD pipeline definition for Jenkins
├── pom.xml             # Maven configuration and dependencies
└── README.md           
```
### Infrastructure Overview

| Host         | Role(s)                                      |
|--------------|----------------------------------------------|
| devops-master| Jenkins Master, Docker Swarm Manager         |
| host-1       | Jenkins Agent, Docker Swarm Worker           |
| host-2       | Jenkins Agent, Docker Swarm Worker           |
| harbor       | Dedicated Harbor Registry VM                 |

### Scaling Services Manually
To scale the `contactbook` service to 5 replicas, run the following command:
```bash
docker service scale contactbook_contactbook=5
```

### Infrastructure Setup & Commands and files
- [Vagrantfile to create Harbor VM](https://github.com/erkdk/devops-journey/blob/main/06-docker/dockerize-dataDash/Vagrantfile-harbor)
- [Commands used on Harbor VM]()
- [Vagrantfile to create the multiple nodes]()
- [Commands used on devops-master node]()
- [Commands used on host-1, host-2 nodes]()

### 📎 Useful References
- [Docker Swarm](https://docs.docker.com/engine/swarm/)
- [Trivy](https://aquasecurity.github.io/trivy/)
- [Jenkins Pipeline Docs](https://www.jenkins.io/doc/book/pipeline/)
- [Harbor](https://goharbor.io/docs/)
- [Maven Lifecycle](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html)

