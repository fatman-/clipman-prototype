#!/usr/bin/env ruby

require_relative 'clipfun'

class ClipboardRecord

  # Object for storing clipboard history data, and metadata

  attr_reader :clips
  attr_accessor :recording, :current_clip
  alias_method :recording?, :recording

  def initialize(recording, length, clips=Array.new)

    # Initialize a ClipboardRecord object for recording Clipboard data

    # @recording - a boolean indicating the tracking state of clipboard
    # @length - the number of the latest clips to be stored
    # @clips - array storing the clips
    # @current clip - the latest clip

    @recording = recording
    @length = length
    @clips = clips
    @current_clip = Clipboard.paste
    @clips << @current_clip
  end

  def add(clip)

    # Add a new clip, while ensuring a check on the no. of clips stored

    # clip - string representing a new clip to be added

    unless @clips.length >= @length
      @clips << clip
    else
      self.delete(0)
      @clips << clip
    end
  end

  def copy(index)
    # Copy a clip, stored at 'index', in @clips
    # index - the position of the element in @clips

    Clipboard.copy(clips[index])
  end

  def delete(index)
    # Delete a clip, stored at 'index', in @clips
    # index - the position of the element in @clips

    clips.delete_at(index)
  end

end
