
# check if the folder exists
if [ ! -d "/home/$USER/data/database" ]; then
    mkdir -p /home/$USER/data/database
fi

if [ ! -d "/home/$USER/data/wordpress" ]; then
    mkdir -p /home/$USER/data/wordpress
fi

sleep 1

sudo chmod 777 /home/$USER/data/database
sudo chmod 777 /home/$USER/data/wordpress
