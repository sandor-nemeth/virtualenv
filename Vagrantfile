# -*- mode: ruby -*-
# vi: set ft=ruby :

# Current directory
current_dir = File.expand_path File.dirname(__FILE__)

# Box configuration
default_box      = "ubuntu/wily64"
box              = ENV['BOX']  || default_box

# Proxy environment
http_proxy       = ENV['VAGRANT_HTTP_PROXY']      || ""
https_proxy      = ENV['VAGRANT_HTTPS_PROXY']     || ""
no_proxy         = ENV['VAGRANT_NO_PROXY']        || "localhost,127.0.0.1"
apt_proxy_http   = ENV['VAGRANT_APT_HTTP_PROXY']  || ""
apt_proxy_https  = ENV['VAGRANT_APT_HTTPS_PROXY'] || ""

Vagrant.require_version ">= 1.7.0"

Vagrant.configure(2) do |config|

  config.vm.synced_folder "#{current_dir}", "/vagrant"

  # This starts bash as a non-login shell, but also tells it to source /etc/profile,
  # which I hypothesised to be the only reason to use a login shell by default
  # http://stackoverflow.com/questions/24421541/vagrant-up-fails-with-stdin-start-ssh-stderr-stdout-errors
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http      = "#{http_proxy}"
    config.proxy.https     = "#{https_proxy}"
    config.proxy.no_proxy  = "#{no_proxy}"
    config.apt_proxy.http  = "#{apt_proxy_h8ttp}"
    config.apt_proxy.https = "#{apt_proxy_https}"
  end

  config.vm.define "vm" do |d|
    d.vm.box = "#{box}"
    d.vm.hostname = "dev"
    d.vm.network "private_network", ip: "10.10.0.10"
    d.vm.provision "shell" do |s|
      s.path = "provision.sh"
      s.env = { VAGRANT_BOX: "#{box}" }
    end
    d.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end