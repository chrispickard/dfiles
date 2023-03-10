{ config, lib, pkgs, ... }:

{
  programs.afew = {
    enable = true;
    extraConfig = ''
      [SpamFilter]
      [KillThreadsFilter]
      [ListMailsFilter]
      [SentMailsFilter]
      sent_tag = sent
      [ArchiveSentMailsFilter]
      # [FolderNameFilter]
      # folder_blacklist = Eman olypsis UTD 'Gmail/[Gmail]' 'Eman/[Gmail]'
      # folder_lowercases = true
      # maildir_separator = /
      [Filter.1]
      query = 'from:capitalone@notification.capitalone.com'
      tags = +bank
      message = Banking
      [Filter.2]
      query = 'from:notifications@github.com OR from:noreply@github.com'
      tags = +github
      message = GitHub
      [Filter.3]
      query = 'from:builds@travis-ci.com OR builds@circleci.com'
      tags = +ci/cd
      message = CI/CD
      [Filter.4]
      query = 'tag:ci/cd AND subject:Passed'
      tags = -new
      message = CI/CD Passed
      [Filter.5]
      query = 'subject:receipt'
      tags = +receipt
      message = Receipt
      [Filter.6]
      query = 'tag:"all mail"'
      tags = -all mail;
      message = remove all mail
      [InboxFilter]
      [MailMover]
      folders = Gmail/Inbox Eman/Inbox UTD/Inbox
      rename = True
      max_age = 15
      Gmail/Inbox = 'tag:spam':Gmail/[Gmail]/Spam 'tag:trash':Gmail/[Gmail]/Trash \
                    'NOT tag:inbox':'Gmail/[Gmail]/All Mail'
      Eman/Inbox = 'tag:spam':Eman/[Gmail]/Spam 'tag:trash':Eman/[Gmail]/Trash \
                    'NOT tag:inbox':'Eman/[Gmail]/All Mail'
      UTD/Inbox = 'tag:spam':'UTD/Deleted Items' 'tag:trash':'UTD/Deleted Items' \
                  'NOT tag:inbox':'UTD/Archive'
      [HeaderMatchingFilter.1]
      header = From
      pattern = .*chris.pickard@tangramflex.com.*
      tags = +chris.pickard@tangramflex.com
      [HeaderMatchingFilter.2]
      header = To
      pattern = .*chris.pickard@tangramflex.com.*
      tags = +chris.pickard@tangramflex.com
      [HeaderMatchingFilter.3]
      header = From
      pattern = .*chrispickard9@gmail.com.*
      tags = +chrispickard9@gmail.com
      [HeaderMatchingFilter.4]
      header = To
      pattern = .*chrispickard9@gmail.com.*
      tags = +chrispickard9@gmail.com
      [HeaderMatchingFilter.5]
      header = From
      pattern = .*thephoenixforce9@gmail.com.*
      tags = +thephoenixforce9@gmail.com
      [HeaderMatchingFilter.6]
      header = To
      pattern = .*thephoenixforce9@gmail.com.*
      tags = +thephoenixforce9@gmail.com
    '';
  };
}
