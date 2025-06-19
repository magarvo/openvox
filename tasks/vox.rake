namespace :vox do
  desc 'Update the version in preparation for a release'
  task 'version:bump:full', [:version] do |_, args|
    abort 'You must provide a tag.' if args[:version].nil? || args[:version].empty?
    version = args[:version]
    abort "#{version} does not appear to be a valid version string in x.y.z format" unless Gem::Version.correct?(version)

    # Update lib/puppet/version.rb and puppet.gemspec
    puts "Setting version to #{version}"
    data = File.read('lib/puppet/version.rb')
    data = data.sub(/PUPPETVERSION = '\d+\.\d+\.\d+'/, "PUPPETVERSION = '#{version}'")
    File.write('lib/puppet/version.rb', data)
    data = File.read('puppet.gemspec')
    data = data.sub(/spec.version = "\d+\.\d+\.\d+"/, "spec.version = \"#{version}\"")
    File.write('puppet.gemspec', data)
  end
end
