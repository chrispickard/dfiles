{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.go-jira ];
  programs.zsh.shellAliases = {
    workon = "${pkgs.git}/bin/git jira";
  };
  home.file.".jira.d/config.yml" = {
    text = ''
endpoint: https://jira.di2e.net
user: chris.pickard
custom-commands:
  - name: sprint
    help: display issues in the current sprint
    script: |-
          {{jira}} list --query "sprint in openSprints() and labels = $JIRA_LABEL and project = $JIRA_PROJECT and type != epic and resolution = unresolved ORDER BY rank asc, created"
  - name: jsonsprint
    help: display issues in the current sprint
    script: |-
          {{jira}} list --template json --query "sprint in openSprints() and labels = $JIRA_LABEL and project = $JIRA_PROJECT and type != epic and resolution = unresolved ORDER BY rank asc, created"
  - name: mine
    help: display issues assigned to me
    script: |-
          {{jira}} list --query "resolution = unresolved and assignee=currentuser() and project = $JIRA_PROJECT ORDER BY priority asc, created"
  - name: jsonmine
    help: display issues assigned to me
    script: |-
          {{jira}} list --template json --query "resolution = unresolved and assignee=currentuser() and project = $JIRA_PROJECT ORDER BY priority asc, created"
        '';
  };
  home.file."bin/git-jira" = {
    source = ./git-jira;
    executable = true;
  };
}
