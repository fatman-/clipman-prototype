#!/usr/bin/env ruby

require_relative 'lib/cliprec'

# the file that stores your clipboard data
clips_file = File.join(__dir__, 'data/cliprec.bin')


unless File.exist? clips_file

  # an array of strings, representing your clipboard history,
  cr_clips = Array.new

  # is serialized, using 'Marshal', and this data is saved into a file,
  File.open(clips_file, 'wb') { |cf| cf.write(Marshal.dump(cr_clips)) }

else

  # for a later retrieval, whenever the need be...
  cr_clips = Marshal.load(File.binread(clips_file))

end


# refer lib/cliprec.rb for the corresponding class definition
# an instance of the ClipboardRecord object, with the arguments:

# true     - for the 'recording' param
#            indicating, this object is actively tracking the clipboard
# 10       - for the 'length' param
#            indicating, the number of the latest clips to be stored
# cr_clips - for the 'clips' param
#            indicating, the array of strings storing the clips
cr_instance = ClipboardRecord.new(true, 10, cr_clips)


puts "Your clipboard is being recorded. Press Ctrl+C to stop."
while cr_instance.recording?
  unless cr_instance.current_clip == Clipboard.paste
    cr_instance.current_clip = Clipboard.paste
    cr_instance.add(cr_instance.current_clip)
    File.open(clips_file, 'wb') { |cf|
      cf.write(Marshal.dump(cr_instance.clips))
    }
  end
end


