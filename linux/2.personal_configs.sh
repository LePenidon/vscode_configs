#bash config.sh

gsettings set org.nemo.preferences show-image-thumbnails 'always'
gsettings set org.gnome.nautilus.preferences click-policy 'double'

echo 'xinput set-prop 12 "libinput Scrolling Pixel Distance" 30' >> ~/.xprofile

dconf load /org/gnome/terminal/ < /home/penidonot/Documents/git_workspace/vscode_configs/linux/teminal_config/terminal_backup.dconf

dconf write /org/gnome/gnome-screenshot/auto-save-directory "'file:///home/$USER/Pictures/Screenshots'"

gsettings set org.gnome.desktop.interface cursor-size 48
sudo sed -i 's/Size=[0-9]*/Size=48/' /usr/share/icons/default/index.theme

mkdir -p ~/.local/share/fonts
wget -P ~/.local/share/fonts "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip"
unzip ~/.local/share/fonts/FiraCode.zip -d ~/.local/share/fonts/FiraCode
rm ~/.local/share/fonts/FiraCode.zip
fc-cache -fv

git config user.name lepenidon
git config user.email penido1000@gmail.com

xdg-mime default vlc.desktop video/x-msvideo
xdg-mime default vlc.desktop video/mp4
xdg-mime default vlc.desktop video/x-matroska
xdg-mime default vlc.desktop video/webm
xdg-mime default vlc.desktop video/x-flv
xdg-mime default vlc.desktop application/ogg