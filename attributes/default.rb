default.greenscreen.install_dir="/opt"
default.greenscreens= [
  {
    :name => "greenscreen",
    :port => "4567",
    :servers => [
      {
        :url => "http://ci.jenkins-ci.org/view/All/cc.xml",
        :username => "",
        :password => "",
        :jobs => "",
        :ignore_jobs => ""
      }
    ]
  }
]