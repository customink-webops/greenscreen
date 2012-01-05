Description
===========

GreenScreen is a build monitoring tool that is designed to be used as a dynamic Big Visible Chart (BVC) in your work area. It lets you add links to your build servers and displays the largest possible information on a monitor so that the team can see the build status from anywhere in the room.

This cookbook configures a node to run one or more GreenScreen applications.  The cookbook uses [CustomInk's clone of the original GreenScreen project](git://github.com/customink/greenscreen.git).

Changes/Roadmap
===============
### v0.0.5
  * add an 'end' that was missing from the default recipe.
  
### v0.0.4
* Changes based on [Foodcritic](http://acrmp.github.com/foodcritic/) recommendations:
  * Use strings in preference to symbols to access node attributes.
  * Avoid repetition of resource declarations (combine git clone and rake init step)

### v0.0.3

* Fix a bug with the config template that was not properly handling explicit jobs or jobs to ignore

### v0.0.2

* Fix a bug with the default attributes
* No longer do a git pull with each chef run, this was causing failures when the config.yml was updated.

Requirements
============

### Cookbooks:

Opscode Cookbooks (http://community.opscode.com/cookbooks)

* git 


Attributes
==========

* `greenscreen/install_dir` - Location where the GreenScreen app will run
* `greenscreens` - An array of GreenScreen configuration parameters.  One entry per GreenScreen
* `greenscreens/name` - The name of this GreenScreen
* `greenscreens/port` - The port used by this GreenScreen
* `greenscreens/servers` - An array of servers that this GreenScreen should watch. One entry per server
* `greenscreens/servers/url` - The URL for this build server
* `greenscreens/servers/username` - The login for this server
* `greenscreens/servers/password` - The password for this server
* `greenscreens/servers/jobs` - Array of jobs to look after.  Leave empty to watch all jobs on this server
* `greenscreens/servers/ignore_jobs` - Array of jobs to ignore.  Leave empty to watch all jobs on this server


Usage
=====

Include the greenscreen recipe to install, configure, and run one or more GreenScreen applications

    include_recipe "greenscreen"

Or add it to your role, or directly to a node's recipes.

