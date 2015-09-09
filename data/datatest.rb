#!/usr/bin/env ruby

# code for testing out whether the data is properly being recorded,
# by printing out the data recorded

clips_file = File.join(__dir__, 'cliprec.bin')
unless File.exist? clips_file
  cr_clips = Array.new
  File.open(clips_file, 'wb') { |cf|
      cf.write(Marshal.dump(cr_clips))
    }
else
  cr_clips = Marshal.load(File.binread(clips_file))
end

cr_clips.each_with_index { |clip, index|
    puts "Clip #{index+1}\n#{clip}\n\n"
}
