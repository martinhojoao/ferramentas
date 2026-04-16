# APT
alias atualizar='sudo apt update && sudo apt upgrade -y'
alias buscar='apt search'
alias instalar='sudo apt install -y'
alias listar='apt list --installed | grep '
alias remover='sudo apt purge -y'
alias limpar='sudo apt autoclean && sudo apt autoremove --purge -y'

# Git
alias add='git add .'
alias cap='git add . && git commit -m "$(date +%F)" && git push'
alias clonar='git clone'
alias commit='git commit -m "$(date +%F)"'
alias desfazer='git stash && git pull'
alias fetch='git fetch'
alias publicar='git add . && git commit -m "$(date +%F)" && git switch --create main && git push --set-upstream origin main'
alias pull='git pull'
alias push='git push'
alias revincular='git remote set-url origin'
alias vincular='git init && git remote add origin'

# Scripts
alias ajustar='bash /home/joao/"Área de trabalho"/Ferramentas/ajustar.sh'
alias contar='bash /home/joao/"Área de trabalho"/Ferramentas/contar.sh'
alias despir='bash /home/joao/"Área de trabalho"/Ferramentas/despir.sh'
alias extrair='bash /home/joao/"Área de trabalho"/Ferramentas/extrair.sh'
alias formatar='bash /home/joao/"Área de trabalho"/Ferramentas/formatar.sh'
alias fps='bash /home/joao/"Área de trabalho"/Ferramentas/fps.sh'
alias mapear='bash /home/joao/"Área de trabalho"/Ferramentas/mapear.sh'
alias normalizar='bash /home/joao/"Área de trabalho"/Ferramentas/normalizar.sh'
alias vestir='bash /home/joao/"Área de trabalho"/Ferramentas/vestir.sh'
alias mover='bash /home/joao/"Área de trabalho"/Ferramentas/mover.sh'
alias renomear='bash /home/joao/"Área de trabalho"/Ferramentas/renomear.sh'

# Outros
alias cat='lolcat'
alias editar='sudo nano'
alias fortune='fortune fortunes riddles | cowsay'
alias free='free -h'
