# Install Git
sudo dnf install -y git

# Install GitHub CLI
sudo dnf install 'dnf-command(config-manager)'
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install -y gh

# Git Config
git config --global user.email "git@techlion.dev"
git config --global user.name "TechLion Dev (via GIT)"

# ZSH
sudo dnf install -y zsh
sudo dnf install -y util-linux-user
chsh -s $(which zsh)

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# ZSH Config
cp -r ./reqFiles/home/.zshrc ~/.zshrc
cp -r ./reqFiles/home/.p10k.zsh ~/.p10k.zsh

# Neofetch
sudo dnf install -y neofetch

# Neofetch Config
rm -rf ~/.config/neofetch
cp -r ./reqFiles/home/.config/neofetch/* ~/.config/neofetch

# Uninstall Pre-Installed Apps
sudo dnf remove -y firefox

# Flatpaks
flatpak install flathub org.gnome.Loupe
flatpak install flathub org.gnome.Extensions
flatpak install flathub com.discordapp.Discord
flatpak install flathub org.gnome.Solanum

# Plymouth Theme
sudo cp -r ./reqFiles/Plymouth/plymouthd.defaults /usr/share/plymouth/plymouthd.defaults
sudo cp -r ./reqFiles/Plymouth/macOS /usr/share/plymouth/themes/macOS
sudo dnf install plymouth-plugin-script
sudo plymouth-set-default-theme macOS && sudo plymouth-set-default-theme macOS -R

# Google Chrome
mkdir ./reqFiles/Apps
curl https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm -o ./reqFiles/Apps/Chrome.rpm
sudo dnf install ./reqFiles/Apps/Chrome.rpm -y

# VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install -y code

# Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install node
node --version
sudo npm install -g yarn
yarn --version

# Catppuccin Discord Theme
curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
chmod +x betterdiscordctl
sudo mv betterdiscordctl /usr/local/bin
betterdiscordctl --d-install flatpak install
echo "You Need To Manually Install the theme: https://github.com/catppuccin/discord"

# Catppuccin GTK Theme
echo "You Need To Manually Install the theme: https://github.com/catppuccin/gtk"

# Install Gnome Extensions
echo "You Need To Manually Install the Following Extensions:"
echo "Add to Desktop"
echo "Blur my Shell"
echo "Clipboard History"
echo "Compiz alike magic lamp effect"
echo "Dash to Dock"
echo "Desktop Cube"
echo "Desktop Icons NG (DING)"
echo "Gnome 4x UI Improvements"
echo "Impatience"
echo "Notification Banner Reloaded"
echo "Rounded Window Corners"
echo "Space Bar"
echo "Tray Icons: Reloaded"
echo "User Themes"