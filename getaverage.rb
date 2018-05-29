#!/usr/bin/env ruby
# coding: utf-8

require 'fileutils'

array = Array.new
ARGV.each_with_index do |file, i|
  array[i] = Array.new(13, 0.0)
  count = Array.new(13, 0.0)
  array[i][0] = file.to_i
  open(file+'.csv', 'r:utf-8') do |f|
    f.each do |line|
      fields = line.chomp.split(',')
      date = fields[0].chomp.split('/')
      array[i][date[1].to_i] += fields[3].to_f
      count[date[1].to_i] += 1
    end
    for j in 1..12
      array[i][j] /= count[j]
    end
  end
end
print "    :"
ARGV.each do |file|
  printf(" %d\t", file)
end
print ':  平均' + "\n"
for i in 1..12
  printf("%2d月:", i)
  avg = 0
  for j in 0...ARGV.size
    printf(" %0.2f\t", array[j][i])
    avg += array[j][i]
  end
  printf(":  %.2f\n", avg/ARGV.size)
end
