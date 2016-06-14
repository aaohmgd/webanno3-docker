#!/usr/bin/sh

echo "building mysql-webanno image in 3 seconds. please stand by."
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
while true; do
    read -p "Do you wish to build the image without cached files?" yn
    case $yn in
        [Yy]* ) docker build --no-cache=true -t mysql-webanno ./mysql/; break;;
        [Nn]* ) docker build -t mysql-webanno ./mysql/;;
        * ) echo "Please answer yes or no.";;
    esac
done

docker build -t mysql-webanno ./mysql/

echo '\n'
echo '\n'
echo "building mysql-webanno image in 3 seconds. please stand by."
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
while true; do
    read -p "Do you wish to build the image without cached files?" yn
    case $yn in
        [Yy]* ) docker build --no-cache=true -t webanno3 ./webanno/; break;;
        [Nn]* ) docker build -t webanno3 ./webanno/;;
        * ) echo "Please answer yes or no.";;
    esac
done
docker build -t webanno3 ./webanno/
