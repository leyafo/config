#!/bin/sh

###############################docker
docker ps #show all of running containers.
docker ps -a #show all of containers include stopped containers..
docker ps -q #just print container's id.
docker commit containerID image_name  #commit the image changes


###############################docker-compose
docker-compose up -d #create container and run in daemon.
docker-compose down #stop containers and remove it.
docker-compose start #start ontainers
docker-compose stop #stop ontainers
docker-compose stop #restart ontainers

###############################docker-compose config
  container-name:
    image: container-image:latest  #you can set version here
    volumes: #mount disk volumns
      - /etc/localtime:/etc/localtime:ro  #sync the local time to container
      - /local_path:/container_path
    ports:
      - "host:local_port:container_port"  #set brige host, it can be empty.
    cpuset: "1"  #bind cpu core to running
    mem_limit: 2500000000  #limited the container memory usage. 
    command: "arg1, arg2 ..."    #command arguments
    container_name: "container-image" #same as the head
    restart: always   #when application cashed, set automatic restart.

###############################logrotate
logrotate -f your_config  #rotate now
/etc/logrotate.conf #the root config file.
#config items explain
daily  #rotate every day
missingok   #don't If the log file is missing, go on to the next one without issuing an error.
create #set file mod owner group. default is to use the same mode, owner, and group as the original file
dateext #set date extation for the rotated file.
dateformat #set the date format, it based on dateext on. default format is %Y%m%d.

##############################awk
#default delimiter is space. the column number started as 1, not 0.
awk '{print $1}' #print first column
awk -F ';' '{print $2}' #set delimiter as ';' 

#xargs


##############################iptables
#A append a rule
#D delete one or more rules.
#p protocol
#d destination address
#dport destination port
#j the target of the rule
iptables -A OUTPUT -p tcp -d 192.168.1.3 --dport 5050 -j DROP  #block the ip and port 
