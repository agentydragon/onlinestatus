Gem::Specification.new do |s|
	s.name = 'onlinestatus'
	s.version = '0.0.2'
	s.date = '2013-07-31'
	s.summary = 'Do you have an internet connection?'
	s.description = <<-EOF
		This simple gem tries to detect your online status
		by pinging a few places.
EOF
	s.authors = [ "Michal Pokorny" ]
	s.email = "pok@rny.cz"
	s.homepage = "http://github.com/MichalPokorny/onlinestatus"
	s.files = Dir["lib/**/*.rb"]
	s.executables = "onlinestatus"
	s.require_paths = [ "lib" ]

	s.add_runtime_dependency 'net-ping'
end
