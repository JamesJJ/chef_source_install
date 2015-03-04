default['source_install']['packages'] = [ "tar", "curl" ]
default['source_install']['install'] = [ "nettle" ]

default['source_install']['nettle']['directories'] = [ '/opt/nettle','/opt/nettle/src' ]
default['source_install']['nettle']['owner'] = 'root'
default['source_install']['nettle']['group'] = 'root'
default['source_install']['nettle']['umask'] = 0o022
default['source_install']['nettle']['remote_file'] = "http://ftp.gnu.org/gnu/nettle/nettle-2.7.1.tar.gz"
default['source_install']['nettle']['download_dir'] = "/opt/nettle/src/"
default['source_install']['nettle']['extract_command'] = "rm -Rf /opt/nettle/src/nettle-2.7.1; tar -xz -C /opt/nettle/src -f /opt/nettle/src/nettle-2.7.1.tar.gz"
default['source_install']['nettle']['working_dir'] = "/opt/nettle/src/nettle-2.7.1"
default['source_install']['nettle']['configure_command'] = "bash ./configure --prefix=/opt/nettle --exec-prefix=/opt/nettle"
default['source_install']['nettle']['make_cmd'] = "make"
default['source_install']['nettle']['install_cmd'] = "make install"
