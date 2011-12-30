default.greenscreen.install_dir="/opt"
default.greenscreens= [
  {
    :name => "greenscreen",
    :port => "4567",
    :servers => [
      {
        :url => "http://fe-build.customink.office:8080/cc.xml"
      }
    ]
  }
]