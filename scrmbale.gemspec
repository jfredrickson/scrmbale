Gem::Specification.new do |s|
  s.name = 'scrmbale'
  s.summary = 'A simple word puzzle game.'
  s.description = 'This library provides the game logic required to build a simple word puzzle game.'
  s.homepage = 'https://github.com/jfredrickson/scrmbale'
  s.version = '0.0.1'
  s.authors = ['Jeff Fredrickson']
  s.email = %w(jeff.fredrickson@gmail.com)
  s.files = `git ls-files -z`.split("\x0")
  s.license = 'MIT'
  s.required_ruby_version = '> 1.9'
  s.require_paths = ['lib']
  s.executables = ['scrmbale']

  s.add_runtime_dependency 'json', '~> 1.4'
end
