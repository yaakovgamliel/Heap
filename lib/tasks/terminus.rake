task :terminus do
  sh <<-EOF
    test -e vendor/gems/terminus || git submodule init;
    git submodule update;
    (
      cd vendor/gems/terminus;
      git submodule init;
      git submodule update;
      npm install;
      rake compile
    )
  EOF
end
