Gem::Specification.new do |s|
  s.name = %q{lolreplay}
  s.version = "0.1.1"
  s.date = %q{2011-12-11}
  s.authors = ["Sam Rose"]
  s.email = %q{samwho@lbak.co.uk}
  s.summary = %q{A library for accessing the metadata of LoL Replay .lrf files.}
  s.homepage = %q{http://github.com/samwho/lolreplay}
  s.description = %q{Allows for access of the metadata in a LoL Replay .lrf file.}
  s.required_ruby_version = '>= 1.9.2'
  s.license = 'GPL-2'
  s.add_dependency "json"

  # Add all files to the files parameter.
  s.files = []
  Dir["**/*.*"].each { |path| s.files.push path }
end
