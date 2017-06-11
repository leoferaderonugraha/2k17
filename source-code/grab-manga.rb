#!/usr/bin/ruby
require 'open-uri'
require 'nokogiri'
require 'mechanize'
#require 'pry'


m = Mechanize.new
links = Nokogiri::HTML(open(ARGV[0])).css('img')
links.each do |x|
  m.get(x['src']).save("#{ARGV[1]}/#{x['src'].split('/').last}")
  puts "Downloading #{x['src'].split('/').last} to #{ARGV[1]}"
end
puts 'Done...'
#binding.pry

=begin
example usage: ./grab-manga http://mangashiro.net/eromanga-sensei-30 ~/Manga/Eromanga-Sensei/Chapter-30
=end
