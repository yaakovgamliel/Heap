task :terminus do
  sh <<-EOF
    test -e vendor/plugins/terminus || git submodule init;
    git submodule update;
    (
      cd vendor/plugins/terminus;
      git submodule init;
      git submodule update;
      npm install;
      rake compile
    )
  EOF
end
