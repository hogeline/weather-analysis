#!/usr/bin/env ruby
# coding: utf-8

ARGV.each do |file|
  count = Hash.new(0)
  date = file.chomp.split('/')
  year = date[0]
  filename = date[1].to_s.chomp.split('.')[0]
  day = -1
  open(file, 'r:utf-8') do |f|
    f.each do |line|
      day += 1
      fields = line.chomp.split(',')
      key = fields[7]
      count[key] += 1
    end
  end
  max =  count.max_by {|_, v| v}[1]
  printf("%s  %s\t:\t%2d回( %.2f%%) ", year, filename, max, max*100/day.to_f)
  count.each_pair do |key, value|
    if value == max
      printf("%s ", key)
    end
  end
  puts ""
end
