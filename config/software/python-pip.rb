name "python-pip"
default_version "latest"

dependency "python"

version "latest" do
  source url: "https://bootstrap.pypa.io/get-pip.py",
         md5: "0ddcdb782d8d7d0e6dd4661eeba1f728"
end

build do
  command "#{install_dir}/embedded/bin/python get-pip.py"
end
