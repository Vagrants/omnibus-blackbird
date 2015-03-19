name "python-pip"
default_version "latest"

dependency "python"

version "latest" do
  source url: "https://bootstrap.pypa.io/get-pip.py",
         md5: "add41078298d8111714c6b87636714f5"
end

build do
  command "#{install_dir}/embedded/bin/python get-pip.py"
end
