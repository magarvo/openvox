# Ensure openvox-server telemetry is off, for one because we wouldn't
# want false results from test runs, and more specifically because of
# reload delays:
# https://github.com/OpenVoxProject/openvox-server/issues/24
test_name 'Disable Dropsonde' do
  skip_test 'not testing with puppetserver' unless @options['is_puppetserver']

  puppetserver_opts = {
    dropsonde: {
      enabled: false,
    },
  }
  puppetserver_conf = File.join("#{master['puppetserver-confdir']}", 'puppetserver.conf')
  modify_tk_config(master, puppetserver_conf, puppetserver_opts)
end
