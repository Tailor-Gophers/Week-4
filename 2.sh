groupadd shared
useradd -m -G shared user1 # -m creates home directory /home/user1
useradd -m -G shared user2 
mkdir /shared_files
touch /shared_files/shared_file
chown user1:shared /shared_files/shared_file # change owner of dir to user1 (read, write) and group to shared (read only) You can also remove :shared but in this situation you don't set gp
chmod g+rw /shared_files/shared_file # add read and write permissions to group
chmod o-rw /shared_files/shared_file # remove read and write permissions from others
rm -r /shared_files # remove dir
userdel -r user1 # -r removes home directory
userdel -r user2
groupdel shared 