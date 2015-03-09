#
# Cookbook Name:: source_install
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


node['source_install']['packages'].each do |_p|
  package _p
end


node['source_install']['install'].each do |_item|

  _success_file = File.join(node['source_install'][_item]['working_dir'],"#{_item.gsub(/[^a-zA-Z0-9\_\-]+/,'')}-CHEF_COMPLETED_SOURCE_INSTALL")
  next if File.exists?(_success_file)

  File.umask(node['source_install'][_item]['umask'] || 0o022)

  node['source_install'][_item]['directories'].each do |_dir|
    directory _dir do
      action :create
      recursive true
      owner node['source_install'][_item]['owner'] || 'root'
      group node['source_install'][_item]['group'] || 'root'
    end
  end

  _file = File.basename(node['source_install'][_item]['remote_file'])

  remote_file File.join(node['source_install'][_item]['download_dir'], _file) do
    source node['source_install'][_item]['remote_file']
  end

  execute "extract #{_file}" do
    environment "PATH" => "/bin:/usr/bin:/usr/sbin:/sbin"
    command node['source_install'][_item]['extract_command']
    cwd node['source_install'][_item]['download_dir']
  end

  execute "configure" do
    environment "PATH" => "/bin:/usr/bin:/usr/sbin:/sbin"
    command node['source_install'][_item]['configure_command']
    cwd node['source_install'][_item]['working_dir']
  end

  execute "make" do
    environment "PATH" => "/bin:/usr/bin:/usr/sbin:/sbin"
    command node['source_install'][_item]['make_command']
    cwd node['source_install'][_item]['working_dir']
  end

  execute "make install" do
    environment "PATH" => "/bin:/usr/bin:/usr/sbin:/sbin"
    command node['source_install'][_item]['install_command']
    cwd node['source_install'][_item]['working_dir']
  end

  file _success_file do
    owner node['source_install'][_item]['owner'] || 'root'
    group node['source_install'][_item]['group'] || 'root'
    mode '0400'
    content Date.today().to_s
  end

end




