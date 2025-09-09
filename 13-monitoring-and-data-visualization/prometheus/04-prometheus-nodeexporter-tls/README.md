
[Securing Prometheus API and UI endpoints using basic auth](https://prometheus.io/docs/guides/basic-auth/)

- For our testing purpose, self signed certificate is generated using the following command. But in production we have to use CA signed certificate.

```
sudo openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout node_exporter.key
-out node_exporter.crt -subj "/C=NP/ST=Kathmandu/L=Kumaripati/O=TechAxis/CN=localhost"
-addext "subjectAltName = DNS:localhost"
```


