#!/usr/bin/ruby
require 'httparty'
require 'nokogiri'
require 'mechanize'
require 'pry'


m = Mechanize.new
m.pluggable_parser.default = Mechanize::Download
status = 0
begin
  links = Nokogiri::HTML(HTTParty.get(ARGV[0])).css('img')
  links.each do |x|
    s = m.get(x['src'])
    status = s.code
    s.save("#{ARGV[1]}/#{x['src'].split('/').last}")
    puts "Downloading #{x['src'].split('/').last} to #{ARGV[1]}"
  end
  puts 'Done...'
rescue
  puts "Error on getting #{ARGV[0]}"
end
#binding.pry

=begin
example usage: ruby grab-manga.rb http://mangashiro.net/eromanga-sensei-31 ~/Manga/Eromanga-Sensei/Chapter-31
=end
