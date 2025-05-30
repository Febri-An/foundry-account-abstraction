-include .env

.PHONY: all test clean deploy fund help install snapshot format anvil scopefile flatten encryptKey

DEFAULT_ANVIL_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

all: remove install build

# Clean the repo
clean :; forge clean

# Remove modules
remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

install :; forge install foundry-rs/forge-std@v1.8.2 --no-commit && forge install openzeppelin/openzeppelin-contracts@v5.3.0 --no-commit && forge install eth-infinitism/account-abstraction@v0.8.0 --no-commit

# Update Dependencies
update:; forge update

format :; forge fmt

anvil :; anvil -m 'test test test test test test test test test test test junk' --steps-tracing --block-time 1

aderyn :; aderyn .

scope :; tree ./src/ | sed 's/└/#/g; s/──/--/g; s/├/#/g; s/│ /|/g; s/│/|/g'

scopefile :; @tree ./src/ | sed 's/└/#/g' | awk -F '── ' '!/\.sol$$/ { path[int((length($$0) - length($$2))/2)] = $$2; next } { p = "src"; for(i=2; i<=int((length($$0) - length($$2))/2); i++) if (path[i] != "") p = p "/" path[i]; print p "/" $$2; }' > scope.txt

# /*//////////////////////////////////////////////////////////////
#                               EVM
# //////////////////////////////////////////////////////////////*/
build:; forge build 

test :; forge test

testFork :; forge test --fork-url mainnet

snapshot :; forge snapshot 