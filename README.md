# Design

| Attribute   | Colour friendly name | Colour code | note |
| ----------- | -------------------- | ----------- | ---- |
| Class names | Yellow               | #FFCB6B     |      |
| String | Green               | #C3E88D     |      |

# Notes

Clone into `~/.config/nvim`

Update Plugins

See `lua/preference.lua` for user level configuration.

```vim
:PackerInstall
:PackerCompile
```

## Lua language server

```sh
brew install ninja
cd ~/.config/nvim

git clone https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive

cd 3rd/luamake
compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
```

## Language servers

```sh
brew install hashicorp/tap/terraform-ls
brew install luarocks
brew install efm-langserver
brew install pandoc
brew install gopls
```

```sh
luarocks install --server=https://luarocks.org/dev luaformatter
```

```sh
yarn global add pyright \
    typescript \
    typescript-language-server \
    dockerfile-language-server-nodejs \
    diagnostic-languageserver
```

Cloudformation

``` sh
pipx install cfn-lsp-extra
```
