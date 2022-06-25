 open your terminal, Create a new directory
''' 
mkdir webserver 
'''

 Now use the vagrant init command to initialise a new vagrant machine.
# vagrant init ubuntu/jammy64

 Then, boot up the virtual machine with:
# vagrant up

 Explore the VM
 Let’s go inside the VM with this command , This gives you an SSH terminal session inside the Ubuntu VM.
# vagrant ssh

 Install the web server
 Install Apache in the Ubuntu VM
# apt list --installed

 Let’s install Apache HTTP Server. First search for it. In Ubuntu, we use the apt search command for this:
# apt search apache2

 Before we install Apache, we should do a package update. This is good practice! It just ensures that we’ve got the latest updates for everything installed on our system:
# sudo apt updgrad -y
# sudo apt update -y

 Now let’s install Apache:
# sudo apt install apache2 -y

 We can see the status of the Apache HTTP Server “service” using the systemctl command:
# systemctl status apache2

 Now let’s make a test request using the curl program. We’ll connect to localhost and port 80 (which is the default port for HTTP):
# curl -v localhost:80

 Set up networking
 We can access the web server from inside the VM. But we want to access the website in a proper web browser. How do we access it from outside the VM (from our desktop)? We’ll need to understand a little about networking, which we’ll do next.

 How to see your VM’s network configuration
# ip a

 Stop the ubuntu VM, enable adapter 2 >> Network >> Bridged Adapter > Select your network adapter >> start the VM.
 Run the below cmd. In My Case, My adapter logical name is "enp0s8", 
# ip a

 Adapter set the down. for set the ip address
# sudo ip link set dev enp0s8 down

 set the static ip for VM, assign the ip from your network with subnetmask"
# sudo ip addr add "Ip of your network with /24" dev enp0s8

 Adapter set the up
# sudo ip link set dev enp0s8 up

 add the your gateway ip in routing table 
# sudo ip route add default via "gateway-IP"

 Confirme the ip in routing table
# ip route show

 Now you can access the webserver using VM-ip:80

 Add some website content
 default file location is /var/www/html, Edit the index.html page

 Now, you can access website using "vm-enp0s8-ip:80"
