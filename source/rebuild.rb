#!/usr/bin/env ruby

require 'pry'

def top(title)
  <<~TOP
  <!doctype html>
  <html>
    <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="chrome=1">
      <title>#{title}</title>

      <link rel="stylesheet" href="/assets/stylesheets/bootstrap.min.css">
      <link rel="stylesheet" href="/assets/stylesheets/styles.css">

      <meta name="viewport" content="width=device-width">
    </head>

    <body>
      <div class="container">
        <div class="row mb-3">
          <div class="col-sm-8 m-auto">
  TOP
end

files_to_process =
  Dir.glob('2015/**/*.html') +
  Dir.glob('2016/**/*.html') +
  Dir.glob('2017/**/*.html') +
  Dir.glob('new_posts/**/*.html')

target_directory = '/root/code/html/Masa331.github.io'

bottom = <<~BOTTOM
          <nav class="mt-3 mb-3">
            <b><a href="/index.html">back to homepage</a></b>
          </nav>
        </div>
      </div>
    </div>
  </body>
</html>
BOTTOM

# RSS feed
rss = "<?xml version='1.0' encoding='UTF-8' ?>\n"
rss << '<rss version="2.0">'
rss << '<channel>'
rss << '<title>Masa331 blog</title>'
rss << '<link>http://masa331.github.io/</link>'
rss << "<description>Premysl Donat's blog</description>"

files_to_process.each do |file|
  content = File.read(file)
  title = content.lines.first.strip
  content = content.lines[1..-1].join

  modified = top(title) + content + bottom

  File.open(target_directory + '/' + file, 'wb') { |f| f.write modified }

  rss_title = title.gsub(' | Masa331 blog', '').gsub('&', 'and').delete('<>').strip
  rss << '<item>'
  rss << "<title>#{rss_title}</title>"
  rss << "<description>#{rss_title}</description>"
  rss << "<link>http://masa331.github.io/new_posts/#{file}</link>"
  rss << '</item>'
end

rss << '</channel>'
rss << '</rss>'
File.open('../rss.xml', 'wb') { _1.write rss }
