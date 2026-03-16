## Not sure it is a good idea on phone that are not mine.
## So uncommented it if you need it.
# pkg update -y
# pkg upgrade -y
pkg install git -y
pkg install gh -y
git config --global user.name "Hello Godot Pi"
git config --global user.email "hellogodotpi@gmail.com"
termux-setup-storage
cd ~/storage/shared/Documents
git config --list
git config --global --add safe.directory ~/storage/shared/Documents
git config --global pull.rebase false
git clone https://github.com/EloiStree/HelloOneDayGodotXR.git
git clone --recursive https://github.com/EloiStree/2025_10_18_godot_hello_godot_script.git