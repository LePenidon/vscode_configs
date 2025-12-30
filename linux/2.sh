#bash config.sh

sudo prime-select intel
gsettings set org.nemo.preferences show-image-thumbnails 'always'
gsettings set org.gnome.nautilus.preferences click-policy 'double'
echo 'xinput set-prop 12 "libinput Scrolling Pixel Distance" 30' >> ~/.xprofile
dconf load /org/gnome/terminal/ < /home/penidonot/Documents/git_workspace/vscode_configs/linux/teminal_config/terminal_backup.dconf
dconf write /org/gnome/gnome-screenshot/auto-save-directory "'file:///home/$USER/Pictures/Screenshots'"

mkdir -p ~/.local/share/fonts
wget -P ~/.local/share/fonts "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip"
unzip ~/.local/share/fonts/FiraCode.zip -d ~/.local/share/fonts/FiraCode
rm ~/.local/share/fonts/FiraCode.zip
fc-cache -fv

git config user.name lepenidon
git config user.email penido1000@gmail.com