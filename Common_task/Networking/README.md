
# Computer Networking
## 1) Basics of terminal
### List network interfaces 
- To list interfaces, I found three commands i.e. `ifconfig`, `ip address` and `nmcli`
- Output of above commands :\
![interface_ifconfig](./interface_ifconfig.png)
![interface_ip](./interface_ip.png)
![interface_nmcli](./interface_nmcli.png)

### Assign Static IP (Using `ip` command)
- To assign static IP and subnet mask
![ip_change](./ip_change.png)
- To change default gateway\
![gateway_change](./gateway_change.png)
- To change DNS to Cloudflare DNS. (Cannot be done by `ip`)
![dns_change](./dns_change.png)
- Result of DNS change\
![dns_result](./dns_result.png)

### Ping a remote server
- Data sent over internet is divided into small segments called packets.
- Sometimes, packets fail to reach their destination called packet loss.
![ping](./ping.png)
- Min, Max, Avg and Mean deviation of round trip time and are shown in above image

### Traceroute
- During transmission of data over internet, it is supposed to cross multiple networks called hop to hop transfer.
- Three stars mean that `traceroute` cannot get IP of routers due to overload and security reasons.
![traceroute](./traceroute.png)

## 2) Basic Network Topology Module
- I used Cisco Packet Tracer for simulation.
- Simulation files (`.pkt`) are also uploaded.
### Star
- In star topology, multiple end devices are connected to single switch.
![star](./star.png)
### Bus
- In this topology, end devices are connected to switch and switches are connected together in a line.
![bus](./bus.png)
### Ring
- In this topology, end devices are connected to switch and switches are connected in ring manner.
![ring](./round.png)

