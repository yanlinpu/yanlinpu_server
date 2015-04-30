#encoding: utf-8
Gem::Specification.new do |s|
  s.name        = 'yanlinpu_server'
  s.version     = `cat VERSION`
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.summary     = "Yanlinpu library"
  s.description = "test for gem & drb"
  s.authors     = ["yanlinpu"]
  s.email       = 'yanlinpu66@163.com'
  s.license     = 'MIT'
  #s.files       = `git ls-files lib/`.split("\n") << 'VERSION'
  s.files       = `find lib/`.split("\n") << 'VERSION'
  s.homepage    =
      'https://github.com/yanlinpu/yanlinpu_server'
end
