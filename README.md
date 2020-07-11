gobinup
=======

`gobinup` is a tool for updating any go programs you have installed with `go get`. It inspects all the binaries you have installed at $GOPATH/bin and attempts to run `go get -u` on each one of them.

## Installation

1. Make sure you are exporting `GO111MODULE=on` in your environment
2. run `gobinup.sh`

## Discussion

`gobinup` relies on go's module system. It is only able to upgrade programs that were installed in "module mode". As opposed to the legacy "gopath mode". This is because when programs are compiled in module mode the module path is compiled into the binary. You can see the difference by running `go version -m $PROGRAM`. 