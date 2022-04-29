#!/bin/bash
yum -y update
yum -y install httpd
systemctl status httpd > /tmp/testfile
echo SUCCESS >> /tmp/testfile
