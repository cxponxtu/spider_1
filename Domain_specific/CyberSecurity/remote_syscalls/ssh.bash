#!/bin/bash

# Credentials for SSH
user="cxpo"
host="192.168.73.104"
pass="1234"

# Copying file from host to remote
sshpass -p $pass scp print.c $user@$host:/home/$user/Desktop

# Running commands on remote
sshpass -p $pass ssh -T $user@$host <<spider 
gcc -o /home/$user/Desktop/test.out /home/$user/Desktop/print.c
strace -o /home/$user/Desktop/test_syscalls.txt /home/$user/Desktop/test.out
spider

# Copying file from remote to host
sshpass -p $pass scp $user@$host:/home/$user/Desktop/test_syscalls.txt remote_syscalls.txt
