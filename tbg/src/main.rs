use clap::Parser;
use std::process::{Command, Output};

#[derive(Parser, Debug)]
struct Args {
    #[arg(short, long, help = "the command to run in background")]
    cmd: String,

    #[arg(short, long = "work-dir", help = "the working directory")]
    wd: String
}

struct Tmux {
    tmux: Command,
    session_name: String,
}

impl Tmux {
    fn new(session_name: String) -> Self {
        Self {
            tmux: Command::new("tmux"),
            session_name
        }

    }
    fn ensure_session (&mut self) -> std::io::Result<Output> {
        let cmd = Command::new("tmux")
            .arg("has-session")
            .arg("-t")
            .arg(self.session_name.clone())
            .output();
        if cmd.is_ok() {
            return cmd;
        }

        self.tmux
            .env_remove("TMUX")
            .arg("new-session")
            .arg("-s")
            .arg(self.session_name.clone())
            .arg("-d")
            .output()


    }
}
fn main() {
    // if we are in session currently, detach
    // then, run arg in new session with name `bg`
    // creating it if it doesn't exist
    // then reattach
    let args = Args::parse();

    let mut tmux = Tmux::new("bg".to_string());
    tmux.ensure_session().expect("TODO: panic message");

    Command::new("tmux")
        .env_remove("TMUX")
        .arg("new-window")
        .arg("-t")
        .arg("bg:")
        .arg(args.cmd)
        .current_dir(args.wd)
        .status()
        .unwrap();
}
