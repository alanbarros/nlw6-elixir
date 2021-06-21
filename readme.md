# Instalação

```bash

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install erlang
```

# Criação do projeto

mix phx.new wabanex --no-html --no-webpack

# Interativo

iex -S mix

# Subir servidor

mix phx.server