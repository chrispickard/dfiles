{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    prometheus
    prometheus-node-exporter
    prometheus-process-exporter
    grafana
    prometheus-alertmanager
  ];
}
