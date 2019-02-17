$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "zapi_app/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "zapi_app"
  spec.version     = ZapiApp::VERSION
  spec.authors     = ["Lewaa Bahmad"]
  spec.email       = ["lewaabahmad@gmail.com"]
  spec.homepage    = "http:://zapi.app"
  spec.summary     = "Allows one to quickly leverage Zapi features for integration."
  spec.description = "Allows one to quickly leverage Zapi features for integration."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.0"
end
