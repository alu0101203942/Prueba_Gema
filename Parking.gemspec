# frozen_string_literal: true

require_relative "lib/Parking/version"

Gem::Specification.new do |spec|
  spec.name = "Parking"
  spec.version = Parking::VERSION
  spec.authors = ["Joel F. Escobar Socas"]
  spec.email = ["alu0101130408@ull.edu.es"]

  spec.summary = %q(Gema parking)
  spec.description = %q(Gema encargada de simular el comportamiento de una aparcamiento )
  spec.homepage = "https://github.com/ULL-ESIT-LPP-2223/gema-joel-escobarsocas-alu0101130408.git"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.com/ULL-ESIT-LPP-2223/gema-joel-escobarsocas-alu0101130408.git"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ULL-ESIT-LPP-2223/gema-joel-escobarsocas-alu0101130408.git"
  spec.metadata["changelog_uri"] = "https://github.com/ULL-ESIT-LPP-2223/gema-joel-escobarsocas-alu0101130408.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
