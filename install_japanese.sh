#!/bin/bash
sudo apt-get install -y --no-install-recommends $(check-language-support)
code --install-extension MS-CEINTL.vscode-language-pack-ja
