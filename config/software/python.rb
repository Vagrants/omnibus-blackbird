name "python"
default_version "2.7.9"

version "2.7.9" do
  source url: "http://www.python.org/ftp/python/#{version}/Python-#{version}.tgz",
         md5: "5eebcaa0030dc4061156d3429657fb83"
end

relative_path "Python-#{version}"

whitelist_file "/opt/blackbird/embedded/lib"

build do
  configure_command = ["./configure",
                       "--prefix=#{install_dir}/embedded",
                       "--libdir=#{install_dir}/embedded/lib",
                       "--includedir=#{install_dir}/embedded/include"]

  command configure_command.join(" ")

  command "make -j #{workers}"
  command "make install"
end
