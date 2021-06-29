# encoding: utf-8
# Install the xapian binaries into the lib folder of the gem
require 'rbconfig'

c = RbConfig::CONFIG

def system!(cmd)
	puts cmd
	system(cmd) or raise
end

ver = '1.4.18'
source_dir = 'xapian_source'
core = "xapian-core-#{ver}"
bindings = "xapian-bindings-#{ver}"
xapian_config = "#{Dir.pwd}/#{core}/xapian-config"

task :default do
	[core,bindings].each do |x|
		system! "tar -xJf #{source_dir}/#{x}.tar.xz"
	end

	prefix = Dir.pwd
	ENV['LDFLAGS'] = "-L#{prefix}/lib"

	system! "mkdir -p lib"

	Dir.chdir core do
		system! 'sed -i".bak" -e "s/darwin\\[91\\]/darwin[912]/g" configure'
		system! "./configure --prefix=#{prefix} --exec-prefix=#{prefix}"
		system! "make clean all"
		system! "cp -r .libs/* ../lib/"
	end

	Dir.chdir bindings do
		system! 'sed -i".bak" -e "s/darwin\\[91\\]/darwin[912]/g" configure'
		ENV['RUBY'] ||= "#{c['bindir']}/#{c['RUBY_INSTALL_NAME']}"
		ENV['XAPIAN_CONFIG'] = xapian_config
		system! "./configure --prefix=#{prefix} --exec-prefix=#{prefix} --with-ruby"
		system! "make clean all"
	end

  system! "cp -r #{bindings}/ruby/.libs/_xapian.* lib"
  system! "cp #{bindings}/ruby/xapian.rb lib"

  system! "rm lib/*.a"
  system! "rm lib/*.la"
  system! "rm lib/*.lai"

  system! "rm -R #{bindings}"
  system! "rm -R #{core}"
  system! "rm -R #{source_dir}"
end
