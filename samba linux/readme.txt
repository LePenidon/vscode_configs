https://www.youtube.com/watch?v=oRHSrnQueak

cd /etc/samba/
mv smb.conf smb.conf.old
sudo mv smb.conf smb.conf.old
sudo code /etc/samba/smb.conf --no-sandbox --user-data-dir=/tmp/vscode-root
testparm
sudo service smbd restart