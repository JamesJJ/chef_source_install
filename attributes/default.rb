default['source_install']['packages'] = [ "tar", "curl" ]
default['source_install']['directories'] = [ ]
default['source_install']['install'] = [ "nettle" ]
default['source_install']['nettle']['remote_file'] = "http://ftp.gnu.org/gnu/nettle/nettle-2.7.1.tar.gz"
default['source_install']['nettle']['file_path'] = "/tmp/"
default['source_install']['nettle']['extract_command'] = "tar -xz -C /opt/nettle/"
default['source_install']['nettle']['working_dir'] = "/opt/nettle/nettle-2.7.1"
default['source_install']['nettle']['configure_cmd'] = "./configure --prefix=/opt/nettle --exec-prefix=/opt/nettle"
default['source_install']['nettle']['make_cmd'] = "make"
default['source_install']['nettle']['install_cmd'] = "make install"
