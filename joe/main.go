package main

import (
	"github.com/magefile/mage/sh"
	"github.com/mattn/go-shellwords"
	"gopkg.in/alecthomas/kingpin.v2"
	"log"
	"os"
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

var (
	app    = kingpin.New("joe", "yooooo joooeeeee!")
	s      = app.Command("switch", "switch to new")
	update = app.Command("update", "update to new")
)

func main() {
	switch kingpin.MustParse(app.Parse(os.Args[1:])) {
	case s.FullCommand():
		cmd := SwitchCmd{}
		err := cmd.Run()
		if err != nil {
			log.Fatalln(err)
		}
	case update.FullCommand():
		cmd := UpdateCmd{}
		err := cmd.Run()
		if err != nil {
			log.Fatalln(err)
		}
	default:
		log.Fatalln(app.Help)
	}
}
