#!/usr/bin/env ruby

module Clipboard

  # Provides finctions for readong and writing to the system clipboard
  # Currently only implemented for the Mac OS

  def self.copy(input)
    str = input.to_s
    IO.popen('pbcopy', 'w') { |f| f << str }
    str
  end

  def self.paste
    `pbpaste`
  end

end
