name "python-setuptools"
default_version "12.0.4"

dependency "python"

version "12.0.4" do
  source url: "https://pypi.python.org/packages/source/s/setuptools/setuptools-#{version}.tar.gz",
         md5: "73cf31ef69758a7a14e743b094ccf328"
end

relative_path "setuptools-#{version}"

build do
  command "#{install_dir}/embedded/bin/python setup.py install"
end
