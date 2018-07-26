#!/usr/bin/env ruby

files_to_process = Dir.glob('**/*.html')
target_directory = '/home/masa331/code/html_js/masa331.github.io'

files_to_process.each do |file|
  content = File.read(file)

  modified = content.lines.map do |line|
    if line.include? 'INSERT'
      partial_path = line.strip.gsub('INSERT ', '')
      File.read partial_path
    else
      line
    end
  end.join

  File.open(target_directory + '/' + file, 'wb') { |f| f.write modified }
end
