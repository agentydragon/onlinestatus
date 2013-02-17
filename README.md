onlinestatus
============

This very simple gem tells you your online status based on pinging a few places.
It is easily fooled, so don't expect it to be reliable in a hostile environment.

Installation
------------

`gem install onlinestatus` or add `onlinestatus` to your Gemfile.

Usage example
-------------

	#!/usr/bin/ruby
	require 'onlinestatus'

	puts "online" if OnlineStatus.online?
	puts "offline" if OnlineStatus.offline?

The gem includes an executable named `onlinestatus`. It prints the
current detected online status, and returns an appropriate exit code:
0 if it seems that you have an internet connection, 1 otherwise.
