#!/usr/bin/env ruby
# coding: utf-8
require 'fileutils'

month = ["January", "February", "March", "April", "May", "June",
         "July", "August", "September", "November", "October", "December"]
ARGV.each do |file|
  puts file + ' を分割'
  filename = File.basename(file, '.csv')
  FileUtils.mkdir(filename) unless FileTest.exist?(filename)
  
  open(file, 'r:utf-8') do |f|
    header = f.first
    month.each do |m|
      open('./'+filename+'/'+m+'.csv', 'w') {|mf| mf.puts header}
    end
    f.each do |line|
      fields = line.chomp.split(',')
      date = fields[0].chomp.split('/')
      path = './'+filename +'/'+ month[date[1].to_i - 1] + '.csv'
      open(path, 'a') do |mf|
        mf.puts line
      end
    end
  end
end
