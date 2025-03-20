namespace :vox do
  desc 'Update version, create tag, and push to origin'
  task :tag, [:tag] do |_, args|
    abort 'You must provide a tag.' if args[:tag].nil? || args[:tag].empty?
    version = args[:tag]
    abort "#{version} does not appear to be a valid version string in x.y.z format" unless Gem::Version.correct?(version)

    # Update lib/puppet/version.rb and puppet.gemspec
    puts "Setting version to #{version}"
    data = File.read('lib/puppet/version.rb')
    data = data.sub(/PUPPETVERSION = '\d+\.\d+\.\d+'/, "PUPPETVERSION = '#{version}'")
    File.write('lib/puppet/version.rb', data)
    data = File.read('puppet.gemspec')
    data = data.sub(/spec.version = "\d+\.\d+\.\d+"/, "spec.version = \"#{version}\"")
    File.write('puppet.gemspec', data)
    run_command("git add lib/puppet/version.rb && git add puppet.gemspec && git commit -m 'Set version to #{version}'")

    # Run git command to get short SHA and one line description of the commit on HEAD
    branch = run_command('git rev-parse --abbrev-ref HEAD')
    sha = run_command('git rev-parse --short HEAD')
    msg = run_command('git log -n 1 --pretty=%B')

    puts "Branch: #{branch}"
    puts "SHA: #{sha}"
    puts "Commit: #{msg}"

    run_command("git tag -a #{version} -m '#{version}'")

    unless !ENV['NOPUSH'].nil?
      puts "Pushing to origin"
      run_command("git push origin && git push origin #{version}")
    end
  end
end
