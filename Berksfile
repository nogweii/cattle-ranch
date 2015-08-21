source 'https://supermarket.chef.io'

cookbook 'mysql'
cookbook 'apt'
cookbook 'git'
cookbook 'sysstat'
cookbook 'chef-client'
cookbook 'omnibus_updater', '~> 1.0.2'
cookbook 'chef_handler'
cookbook 'sudo'
cookbook 'php-fpm'
cookbook 'logrotate'
cookbook 'build-essential'
cookbook 'chef-sugar'
cookbook 'chef-vault'
cookbook 'hipchat'
cookbook 'motd', git: 'https://github.com/evaryont/motd'
cookbook 'sshd'
cookbook 'brightbox-ruby', '~> 1.2.0'
cookbook 'taskwarrior'
cookbook 'locale'
cookbook 'system', git: 'https://github.com/xhost-cookbooks/system', ref: '11bb41f10178c8927328affa5730020b2617b53f'
cookbook 'auditd', git: 'https://github.com/yakara-ltd/auditd', ref: '63faedd23abfd768aa0f13c698cb3e9b335836f8'
cookbook 'apt-periodic', '~> 0.2.0'
cookbook 'os-hardening', '~> 1.2.0'
cookbook 'ntp'
cookbook 'mosh'
cookbook 'pam', '~> 1.0.1'
cookbook 'pacman', git: 'https://github.com/logankoester/pacman', ref: 'fd7be0f818f2b79dbd812d93fcafb2ed78a88e00'
cookbook 'tinc', git: 'https://github.com/evaryont/chef-cookbook-tinc', ref: '520608d77fafaf9cafe969ce85f8f0939a64212c'
cookbook 'encrypted_blockdevice', git: 'https://github.com/atrull/encrypted_blockdevice_cookbook.git', ref: '169f3ba1127b89f53bc2ba8dfccae46f4ed60861', branch: 'develop'

Dir['cookbooks/*'].each do |cookbook_dir|
  cookbook File.basename(cookbook_dir), path: cookbook_dir
end
