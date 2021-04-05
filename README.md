# unidata-jekyll-theme and unidata-jekyll-plugins

This repository contains a jekyll theme and associated plugins for Unidata documentation.
This is a fork of the excellent [documentation-theme-jekyll](https://idratherbewriting.com/documentation-theme-jekyll) theme, with Unidata specific styling and extensions.
In order to work with this repository, you will need to install Ruby.

## Installing Ruby
The Jekyll documentation has pointers on how to do that for the [various platforms](https://jekyllrb.com/docs/installation/).
I was able to do this on Windows without any issues following the [RubyInstaller](https://jekyllrb.com/docs/installation/windows/#installation-via-rubyinstaller) instructions.

## Working with this repository

Once you have set up Ruby and cloned the repository, open the command line and go to the root of your local repository and execute the following command:

~~~sh
bundle install
~~~

To live edit the theme in a browser, run:

~~~sh
bundle exec jekyll serve
~~~

You should see something similar to the following:

~~~posh
Configuration file: C:/Users/sarms/dev/unidata/repos/unidata-jekyll-theme/_config.yml
 Theme Config file: C:/Users/sarms/dev/unidata/repos/unidata-jekyll-theme/_config.yml
            Source: C:/Users/sarms/dev/unidata/repos/unidata-jekyll-theme
       Destination: C:/Users/sarms/dev/unidata/repos/unidata-jekyll-theme/_site
 Incremental build: disabled. Enable with --incremental
      Generating...
                    done in 3.96 seconds.
  Please add the following to your Gemfile to avoid polling for changes:
    gem 'wdm', '>= 0.1.0' if Gem.win_platform?
 Auto-regeneration: enabled for 'C:/Users/sarms/dev/unidata/repos/unidata-jekyll-theme'
    Server address: http://127.0.0.1:4000
  Server running... press ctrl-c to stop.
~~~

Note the `Server address` in the output - this is where you should point your browser to see a live view of the documentation.
Each time a documentation file is edited and saved, Jekyll will regenerate the html file:

~~~posh
Regenerating: 1 file(s) changed at 2021-04-01 13:35:51
              pages/unidata/DocGuide.md
              ...done in 1.735274 seconds.
~~~

To build the static site, run:

~~~sh
bundle exec jekyll build
~~~

If you would like to remove any temporary files generated from the build, run:

~~~sh
bundle exec jekyll clean
~~~

Edit away, and get your `git` on!

## publishing

### Initial setup

We will be publishing the gem file for our theme to the Unidata [Nexus Repository Manager server](https://artifacts.unidata.ucar.edu/#browse/browse:unidata-gems).
In order to do this, you will need to install the `nexus` gem:

~~~sh
gem install nexus
~~~

Next, you will need to increment the version(s) of the gem(s) to be published.
This github repository manages the generation and publication of two Ruby gems, and each are versioned independently.
A new release of the `unidata-jekyll-plugin` gem will be required any time a change is made to the files under the `_plugins/` directory.
All other changes will require a new release of the `unidata-jekyll-theme` gem.
If you need to make new releases for both gems, start by releasing the `unidata-jekyll-plugin`, as the `unidata-jekyll-theme` depends on it.
The following steps apply for releasing both the `unidata-jekyll-theme` gem as well as the `unidata-jekyll-plugin` gem (with one noted exception).

First, change the `spec.version` entry in `.gemspec` file (following [Semantic Versioning](https://semver.org/)).
Note: if you are updating both gems, you will also need to update the `spec.add_runtime_dependency` entry in `unidata-jekyll-theme.gemspec` to account for the new plugin version.

Next, build the gem file using:

~~~sh
gem build <gem-name>.gemspec
~~~

For example,

~~~sh
gem build unidata-jekyll-plugins.gemspec
~~~

This will create a gem file called `<gem-name>-<version>.gem` (e.g. `unidata-jekyll-plugins-0.0.2.gem`).

Finally, publish the gem file to the Unidata nexus gem repository using

~~~sh
gem nexus <gem-name>-<version>.gem
~~~

For example,

~~~sh
gem nexus unidata-jekyll-plugins-0.0.2.gem
~~~

The first time you run this command, the nexus gem will ask you for the url of the server you would like to publish to, as well as your credentials.
The url you want to use is `https://artifacts.unidata.ucar.edu/repository/unidata-gems`.
These are cached and reused in the future.

Since the theme is consumed by Java projects using `JRuby`, we also need to publish the gem files as Maven artifacts.
This is done using `gradle`.
The gradle build is configured to read the version of each gem from that gems' associated `gemspec` file.
This means there are no configuration files to update when publishing the Maven artifact of the gem file.
All that is needed is to run the appropriate task using gradle.

If a new release of the `unidata-jekyll-plugins` artifact is needed, publish the corresponding maven artifact using:

~~~sh
./gradlew clean publishPlugin
~~~

If a new release of the `unidata-jekyll-theme` artifact is needed, use:

~~~sh
./gradlew clean publishTheme
~~~

If both artifacts have a new release, you can publish them both with one command:

~~~sh
./gradlew clean publish
~~~

Note that the gem files must be created using Ruby before publishing them as Maven artifacts.

The full steps needed to publish everything will look something like the following:

~~~sh
rm .\unidata-jekyll-plugins-<old-version>.gem
rm .\unidata-jekyll-theme-<old-version>.gem

gem build .\unidata-jekyll-plugins.gemspec
gem nexus .\unidata-jekyll-plugins-<new-version>.gem

gem build .\unidata-jekyll-theme.gemspec
gem nexus .\unidata-jekyll-theme-<new-version>.gem

./gradlew clean publish
~~~

## Using the gem-based theme in your own documentation

### Ruby

Since the Unidata theme related gem files are hosted on our Nexus server, you will need to tell your Ruby installation that the Nexus server exists:

~~~sh
gem sources --add https://artifacts.unidata.ucar.edu/repository/gems/
~~~

Once you have done this, you can generally follow the jekyll documentation regarding the installation and use of a [gem based theme](https://jekyllrb.com/docs/themes/#installing-a-theme).
You will also need to make sure you include the `unidata-jekyll-plugin` gem.
As this theme progresses, we will add more details about Unidata specific extensions to the theme, but for now, consider this a work in progress :-)

### Java

Unidata maintains a [gradle plugin](https://github.com/Unidata/unidata-jekyll-gradle) that utilizes JRuby to run Jekyll to build Jekyll sites using the Unidata theme maintained in this repository.
While useful for Java based projects, it is also useful to those want to build documentation sets without installing the full Ruby stack.
The only requirement for using the gradle plugin is Java version 8 or greater.

The gradle build in this project uses the `unidata-jekyll-gradle` plugin.
However, if you would like to use the plugin to build and serve the files in this repo, you must make a few edits prior to running `./gradlew buildJekyllSite` or `./gradlew serveJekyllSite`.
1. edit `_config.yml` and comment out the line setting the theme (that is, add a  `#` to the beginning of the line `theme: unidata-jekyll-theme`)
1. move the file `Gemfile` to a temporary directory.

Note that both of these changes **must** be undone before making pull requests with changes or publishing artifacts.
Once changed, simply execute the following from the command line at the top level of the github repo:

~~~bash
./gradlew serveJekyllSite
~~~

Jekyll will start:

~~~posh
> Task :serveJekyllSite
Configuration file: C:\Users\sarms\dev\unidata\repos\unidata-jekyll-theme/_config.yml
            Source: C:\Users\sarms\dev\unidata\repos\unidata-jekyll-theme
       Destination: C:/Users/sarms/dev/unidata/repos/unidata-jekyll-theme/_site
 Incremental build: disabled. Enable with --incremental
      Generating...
                    done in 16.19 seconds.
  Please add the following to your Gemfile to avoid polling for changes:
    gem 'wdm', '>= 0.1.0' if Gem.win_platform?
 Auto-regeneration: enabled for 'C:\Users\sarms\dev\unidata\repos\unidata-jekyll-theme'
    Server address: http://127.0.0.1:4000
  Server running... press ctrl-c to stop.
<========-----> 66% EXECUTING [1m 5s]
> :serveJekyllSite
~~~

Note the `Server address` in the output - this is where you should point your browser to see a live view of the documentation.
Each time a documentation file is edited and saved, Jekyll will regenerate the html file:

~~~bash
Regenerating: 1 file(s) changed at 2021-04-01 13:43:40
              pages/unidata/DocGuide.md
              ...done in 8.897 seconds.
~~~

## Potentially useful utilities

The `utilities/` directory contains some potentially useful scripts from the upstream repository for generating tags and pdf docs.
They were sort of cluttering up the main directory of the repo, so I moved them.

