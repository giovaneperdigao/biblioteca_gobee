Testes realizados no ubuntu 16.04(virtual machine)
No terminal:
sudo apt-get install git
sudo apt-get install bundler
sudo apt-get install libsqlite3-dev
sudo apt-get install zlib1g-dev
git clone https://github.com/giovaneperdigao/biblioteca_gobee.git
cd biblioteca_gobee
bundle install
rake db:migrate
rails s

no navegador:
o endereço da aplicação será http://localhost:3000
se não for o endereço será informado no terminal ao levantar o servidor
