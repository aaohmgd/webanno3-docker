#!/usr/bin/bash

# this is a simple bash testing script that tries to build the dockerfile
# and run a container of the compiled image.

# a fancy spinning wheel function.


echo "starting docker build test in 3 seconds. please stand by."
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
while true; do
    read -p "Do you wish run the test without cached files?" yn
    case $yn in
        [Yy]* ) docker build --no-cache=true -t webanno3 https://github.com/fkuhn/webanno3-docker.git | tee buildtest.log; break;;
        [Nn]* ) docker build -t webanno3 https://github.com/fkuhn/webanno3-docker.git | tee buildtest.log;;
        * ) echo "Please answer yes or no.";;
    esac
done
# docker build -t webanno3 https://github.com/fkuhn/webanno3-docker.git | tee buildtest.log
echo '\n'
echo '\n'
echo 'buildtest.log written to .'
echo '\n'
echo '\n'
echo 'starting webanno container in 3 seconds. please stand by.'
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
docker run -it webanno3  && curl \
--request POST \
--data "user=kuhn&password=elunlim37" \
-D- \
http://localhost:18080/webanno/welcome.html
echo '\n'
echo '\n'
echo 'runtest.log written to .'
echo 'test finished'
