Gem::Specification.new do |s|
  s.name = "prawn-blank"
  s.version = "0.0.1"
  s.date = %q{2010-06-02}
  s.authors = ["HannesG"]
  s.email = %q{hannes.georg@googlemail.com}
  s.summary = %q{prawn-blank adds forms to prawn}

  s.description = %q{prawn-blank adds forms to prawn}
  s.files = Dir.glob("{lib}/**/**/*") + ["Rakefile"]
  s.require_path = "lib"
  s.add_dependency "prawn", ">= 0.8.4"
  s.add_development_dependency('rspec')
  s.has_rdoc = true
end
