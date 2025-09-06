In this example, 
Different node (vm) is monitored from the another vm where the prometheus setup is already done.

To do so, node_exporter is installed and set up in the node (vm) using the systemd service and
the new job is created in the prometheus.yml file of the prometheus vm.
