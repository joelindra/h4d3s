  #!/usr/bin/bash

  if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root. Exiting."
  exit 1
  fi

  apt update && apt upgrade -y
  apt install figlet rush wafw00f
  apt install golang ffuf -y
  apt install dnsx git subjack seclists massdns ffuf nikto nmap subfinder toilet pip npm -y
  apt install zsh curl wget amass -y
  sudo snap install amass
  sudo apt install python3-pip
  pip install shodan
  git clone https://github.com/projectdiscovery/fuzzing-templates.git "$home_dir/fuzzing-templates"

  clear
  figlet -w 100 -f small Install All Tools
  go install -v github.com/kacakb/jsfinder@latest
  go install github.com/tomnomnom/unfurl@latest
  go install github.com/lukasikic/subzy@latest
  go install github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
  go install github.com/hahwul/dalfox/v2@latest
  go install github.com/OWASP/Amass/v3/...@master 
  go install github.com/projectdiscovery/notify/cmd/notify@latest
  go install github.com/tomnomnom/qsreplace@latest
  go install github.com/hakluke/hakrawler@latest 
  go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
  go install github.com/projectdiscovery/httpx/cmd/httpx@latest 
  go install github.com/tomnomnom/httprobe@latest
  go install github.com/tomnomnom/waybackurls@latest
  go install github.com/tomnomnom/assetfinder@latest
  go install github.com/tomnomnom/fff@latest
  go install github.com/tomnomnom/anew@latest
  go install github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
  go install github.com/lc/gau/v2/cmd/gau@latest
  go install github.com/musana/mx-takeover@latest
  go install github.com/projectdiscovery/katana/cmd/katana@latest
  go install github.com/Ice3man543/SubOver@latest
  go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
  go install github.com/ezekg/git-hound@latest
  go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest

  clear
  figlet -w 100 -f small Install MassDNS Resolvers
  cd /root
  wget https://raw.githubusercontent.com/blechschmidt/massdns/master/lists/resolvers.txt && cp resolvers.txt /usr/share/seclists/
  cd /root && rm -rf resolvers.txt
  
  clear
  figlet -w 100 -f small Install GF
  cd /root && git clone https://github.com/tomnomnom/gf.git
  cd /usr/local/ && mkdir go 
  cd /root
  cd /usr/local/go && mkdir src bin
  cd /root/gf && cp *.zsh /usr/local/go/src
  cd /root && git clone https://github.com/1ndianl33t/Gf-Patterns.git
  go install  github.com/tomnomnom/gf@latest
  cp /root/go/bin/gf /usr/local/go/bin/
  cd /root
  echo source /usr/local/go/src/gf-completion.zsh >> ~/.zshrc
  source ~/.zshrc
  cd /root && cp -r gf/examples ~/.gf
  cd /root && cp Gf-Patterns/*.json ~/.gf
  cd /root

  clear
  figlet -w 100 -f small Install Ghauri
  cd /root && git clone https://github.com/r0oth3x49/ghauri.git \
    && cd ghauri \
    && python3 -m pip install --upgrade -r requirements.txt \
    && python3 setup.py install \
    && ghauri --help

  clear
  figlet -w 100 -f small "Install SecretFinder"
  echo "127.0.0.1 $(hostname)" | sudo tee -a /etc/hosts
  git clone https://github.com/m4ll0k/SecretFinder.git secretfinder
  cd secretfinder
  if [ -f SecretFinder.py ]; then
      sudo cp SecretFinder.py /usr/bin/secretfinder.py && sudo sed -i '1s/python$/python3/' /usr/bin/secretfinder.py && sudo chmod +x /usr/bin/secretfinder.py;
  else
      echo "secretfinder.py not found."
  fi
  pip install -r requirements.txt
  pip install jsbeautifier lxml requests requests_file
  shodan init Z2oDsaHG35oCrPkzMDZbl9zMsFMhGoWE
  echo "SecretFinder has been installed."
  
  clear
  mod(){
  cp /root/go/bin/* /usr/bin/
  echo -e '#!/bin/bash\nbash /root/H4D3S/hades $1' | sudo tee /usr/bin/hades > /dev/null && sudo chmod +x /usr/bin/hades
  figlet -w 100 -f small Copy_all_tools!
  echo -e $MAGENTA""
  }
  mod
