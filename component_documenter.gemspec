Gem::Specification.new do |s|
  s.name = "component_documenter"
  s.version = "0.0.2"
  s.summary = " "
  s.description = " "

  s.authors = ["sam@hubbado.com"]
  s.homepage = "http://github.com/hubbado/component_documenter"
  s.licenses = ["TODO"]

  s.require_paths = ["lib"]
  s.files = [*Dir.glob("{lib}/**/*"), 'init.rb', 'load_path.rb']
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = ">= 3.2"
  s.executables = ['generate_component_documentation']

  s.add_runtime_dependency 'yard'

  s.add_development_dependency 'debug'
  s.add_development_dependency "hubbado-style"
  s.add_development_dependency "test_bench"
end
