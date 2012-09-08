# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "mwp_themes_proposal_client"
  s.summary = "Themes proposal client-side client gem"
  s.authors = [ 'Ivan Kasatenko' ]
  s.description = "Themes proposal client-side client gem"
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.2"
end