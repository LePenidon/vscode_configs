#bash config.sh


gsettings set org.nemo.preferences show-image-thumbnails 'always'
echo 'xinput set-prop 12 "libinput Scrolling Pixel Distance" 30' >> ~/.xprofile
dconf load /org/gnome/terminal/ < /home/penidonot/Documents/git_workspace/vscode_configs/linux/teminal_config/terminal_backup.dconf
dconf write /org/gnome/gnome-screenshot/auto-save-directory "'file:///home/$USER/Pictures/Screenshots'"