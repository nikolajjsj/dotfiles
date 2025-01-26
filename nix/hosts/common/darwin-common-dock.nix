{ config, ... }:
{
  system.defaults.dock = {
    persistent-apps = [
      "/Applications/Google Chrome.app"
      "/Applications/Signal.app"
      "/Applications/Slack.app"
      "/Applications/Ghostty.app"
    ];
  };
}
