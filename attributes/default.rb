# The method used to install kibana.  `git` will clone the git repo,
# `file` will download from elasticsearch.org
# git is not really supported since the move to java based server.
default['kibana_lwrp']['install_type'] = 'file' # git | file
default['kibana_lwrp']['version'] = '4.0.0-linux-x64' # must match version number of kibana being installed

# Values to use for git method of installation
default['kibana_lwrp']['git']['url'] = 'https://github.com/elasticsearch/kibana'
default['kibana_lwrp']['git']['branch'] = 'v4.1.1'
default['kibana_lwrp']['git']['type'] = 'sync' # checkout | sync
default['kibana_lwrp']['git']['config'] = 'kibana/config.js' # relative path of config file
default['kibana_lwrp']['git']['config_template'] = 'config.js.erb' # template to use for config
default['kibana_lwrp']['git']['config_template_cookbook'] = 'kibana_lwrp' # cookbook containing config template

# Values to use for file method of installation
default['kibana_lwrp']['file']['type'] = 'tgz' # zip | tgz

default['kibana_lwrp']['file']['url'] = 'https://download.elasticsearch.org/kibana/kibana/kibana-4.1.1-linux-x64.tar.gz'
default['kibana_lwrp']['file']['checksum'] = nil # sha256 ( shasum -a 256 FILENAME )
default['kibana_lwrp']['file']['config'] = 'config/kibana.yml' # relative path of config file
default['kibana_lwrp']['file']['config_template'] = 'kibana.yml.erb' # template to use for config
default['kibana_lwrp']['file']['config_template_cookbook'] = 'kibana_lwrp' # cookbook containing config template

# Kibana Java Web Server
default['kibana_lwrp']['java_webserver_port'] = 5601

# this is only used by the recipe.  if you use the LWRPs
# (which you should) then install java from your own recipe.
default['kibana_lwrp']['install_java'] = true

# Which webserver to use, and webserver options.
default['kibana_lwrp']['webserver'] = 'nginx' # nginx or apache
default['kibana_lwrp']['webserver_hostname'] = node.name
default['kibana_lwrp']['webserver_aliases'] = [node['ipaddress']]
default['kibana_lwrp']['webserver_listen'] = node['ipaddress']
default['kibana_lwrp']['webserver_port'] = 80
default['kibana_lwrp']['webserver_scheme'] = 'http://'

# parent directory of install_dir.  This is required because of the `file` method.
default['kibana_lwrp']['install_path'] = '/opt'

# the actual installation directory of kibana. If using the `file` method this should be left as is.
default['kibana_lwrp']['install_dir'] = "#{node['kibana_lwrp']['install_path']}/kibana"

# used to configure proxy information for the webserver to proxy ES calls.
default['kibana_lwrp']['es_server'] = '127.0.0.1'
default['kibana_lwrp']['es_port'] = '9200'
default['kibana_lwrp']['es_role'] = 'elasticsearch_server'
default['kibana_lwrp']['es_scheme'] = 'http://'

# user to install kibana files as.  if left blank will use the default webserver user.
default['kibana_lwrp']['user'] = 'kibana'

# config template location and variables.
default['kibana_lwrp']['config']['kibana_index']  = 'kibana-int'
default['kibana_lwrp']['config']['panel_names']   =  %w(histogram map pie table filtering timepicker text fields hits dashcontrol column derivequeries trends bettermap query terms)
default['kibana_lwrp']['config']['default_route'] = '/dashboard/file/logstash.json'
# include quote inside this next variable if not using window.location style variables...
# e.g.  = "'http://elasticsearch.example.com:9200'"
default['kibana_lwrp']['config']['elasticsearch'] = "window.location.protocol+\"//\"+window.location.hostname+\":\"+window.location.port"

# nginx variables
default['kibana_lwrp']['nginx']['install_method'] = 'package'
default['kibana_lwrp']['nginx']['template'] = 'kibana-nginx.conf.erb'
default['kibana_lwrp']['nginx']['template_cookbook'] = 'kibana_lwrp'
default['kibana_lwrp']['nginx']['enable_default_site'] = false
default['kibana_lwrp']['nginx']['install_method'] = 'package'

# Apache variables.
default['kibana_lwrp']['apache']['template'] = 'kibana-apache.conf.erb'
default['kibana_lwrp']['apache']['template_cookbook'] = 'kibana_lwrp'
default['kibana_lwrp']['apache']['enable_default_site'] = false
