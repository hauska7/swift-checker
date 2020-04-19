Gem::Specification.new do |s|
  s.name               = "swift-checker"
  s.version            = "0.0.2"
  s.default_executable = "swift_checker"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Grzegorz Hauska"]
  s.date = %q{2020-04-19}
  s.description = %q{A wsift codes validator}
  s.email = %q{grzegorz.hauska@gmail.com}
  s.files = ["Rakefile", "lib/swift_checker.rb", "bin/swift_checker"]
  s.test_files = ["test/test_swift_checker.rb"]
  s.homepage = %q{https://github.com/hauska7/swift-checker}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Allows for validating SWIFT/BIC codes}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

