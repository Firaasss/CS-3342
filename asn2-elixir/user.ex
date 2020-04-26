##############################################################################
# Assignment : 5
# Author     : FIRAS ABOUSHAMALAH
# Email      : fabousha@uwo.ca
# 
# This file creates the struct defined as User which requires a username and password to enter the Shopping List Store
##############################################################################

defmodule User do
	@enforce_keys [:username, :password]
	defstruct [:username, :password]
end 