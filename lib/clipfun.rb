#!/usr/bin/env ruby

module Clipboard

  # Provides functions for reading and writing to the system clipboard
  # Currently, only implemented for the Mac OS

  def self.copy(input)
    # Using Mac OS's command line tool 'pbcopy' for copying input text
    # input - text string to be copied to the system clipboard

    str = input.to_s
    IO.popen('pbcopy', 'w') { |f| f << str }
    str
  end

  def self.paste
    # Using Mac OS's command line tool 'pbpaste' for pasting the current clip
    `pbpaste`
  end

end
