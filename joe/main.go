package main

import (
	"github.com/alecthomas/kong"
	"github.com/magefile/mage/sh"
	"github.com/mattn/go-shellwords"
)

type SwitchCmd struct{}

func (s *SwitchCmd) Run() error {
	err := run("nix build .#homeConfigurations.chrispickard.activationPackage")
	if err != nil {
		return err
	}
	err = run("result/activate")
	return err
}

type UpdateCmd struct{}

func (s *UpdateCmd) Run() error {
	err := run("nix build --recreate-lock-file .#homeConfigurations.chrispickard.activationPackage")
	if err != nil {
		return err
	}
	err = run("result/activate")
	return err
}

func run(cmd string) error {
	parse, err := shellwords.Parse(cmd)
	if err != nil {
		return err
	}
	if len(parse) == 1 {
		err = sh.RunV(parse[0])
		if err != nil {
			return err
		}
	} else if len(parse) > 1 {
		err = sh.RunV(parse[0], parse[1:]...)
		if err != nil {
			return err
		}
	}
	return nil
}

var CLI struct {
	Switch SwitchCmd `cmd:"" help:"helpers"`
	Update UpdateCmd `cmd:"" help:"helpers"`
}

func main() {
	ctx := kong.Parse(&CLI)
	err := ctx.Run()
	ctx.FatalIfErrorf(err)
}
