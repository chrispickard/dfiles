use std::env;
use std::path::PathBuf;
use std::process::{Child, Command};

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
    fn ensure_session (&mut self){
        let cmd = Command::new("tmux")
            .arg("has-session")
            .arg("-t")
            .arg(self.session_name.clone())
            .spawn();
        if cmd.is_ok() {
            return;
        }

        self.tmux
            .arg("new-session")
            .arg("-s")
            .arg("bg");
    }
    fn spawn(&mut self) -> std::io::Result<Child> {
        self.tmux.spawn()
    }
}
fn main() {
    // if we are in session currently, detach
    // then, run arg in new session with name `bg`
    // creating it if it doesn't exist
    // then reattach
    let home = env::var("HOME").unwrap();
    let path: PathBuf = [&home, "dev", "programs", "orcas"].iter().collect();
    let mut tmux = Tmux::new("bg".to_string());
    tmux.ensure_session();
    tmux.spawn().unwrap();

    // let status= Command::new("tmux")
    //     .arg("new-session")
    //     .arg("-s")
    //     .arg("bg")
    //     .arg("-d")
    //     .env_remove("TMUX")
    //     .current_dir(&path)
    //     .arg("direnv exec . libreoffice")
    //     .status()
    //     .unwrap();
    // println!("{}", status);
}
