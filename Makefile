export DAPP_SOLC_VERSION=0.4.24
all    :; dapp build
clean  :; dapp clean
test   :; dapp test -vv
debug  :; hevm interactive
