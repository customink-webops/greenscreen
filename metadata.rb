maintainer       "CustomInk, LLC"
maintainer_email "nharvey@customink.com"
license          "Apache 2.0"
description      "Installs/Configures greenscreen"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.5"

depends "git"

recipe            "default", "Installs, configures, and runs a GreenScreen application."

attribute "greenscreen/install_dir",
  :display_name => "GreenScreen Installation Directory",
  :description => "Location where the GreenScreen app will run",
  :default => "/opt"

attribute "greenscreens",
  :display_name => "GreenScreens",
  :description => "An array of GreenScreen configuration parameters.  One entry per GreenScreen",
  :default => "A single GreenScreen"

attribute "greenscreens/name",
  :display_name => "GreenScreen Name",
  :description => "The name of this GreenScreen",
  :default => "greenscreen"

attribute "greenscreens/port",
  :display_name => "GreenScreen Port",
  :description => "The port used by this GreenScreen",
  :default => "/4567"

attribute "greenscreens/servers",
  :display_name => "Servers",
  :description => "An array of servers that this GreenScreen should watch. One entry per server",
  :default => "A single server"

attribute "greenscreens/servers/url",
  :display_name => "Server URL",
  :description => "The URL for this build server",
  :default => "http://ci.jenkins-ci.org/view/All/cc.xml"

attribute "greenscreens/servers/username",
  :display_name => "Server Username",
  :description => "The login for this server",
  :default => ""

attribute "greenscreens/servers/password",
  :display_name => "Server Password",
  :description => "The password for this server",
  :default => ""

attribute "greenscreens/servers/jobs",
  :display_name => "Server Jobs to Watch",
  :description => "Array of jobs to look after.  Leave empty to watch all jobs on this server",
  :default => ""

attribute "greenscreens/servers/ignore_jobs",
  :display_name => "Server Jobs to Ignore",
  :description => "Array of jobs to ignore.  Leave empty to watch all jobs on this server",
  :default => ""
