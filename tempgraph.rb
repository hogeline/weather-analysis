#!/usr/bin/env ruby
# coding: utf-8

require 'csv'

table = CSV.table(ARGV[0], encoding: "UTF-8").by_col!
hight = 5 - table[4].max.to_i % 5 + table[4].max.to_i
low = table[5].min.to_i - table[5].min.to_i % 5
date = table[0][0].chomp.split('/')
printf("             %d年%d月\n", date[0], date[1])
puts "[度]"
hight.downto(low) do |i|
  if i % 5 == 0
    printf('%3d:', i)
  else
    print '   :'
  end
  table[3].zip(table[4], table[5]).each do |avg, max, min|
    if max.to_i == i
      print 'A'
    elsif avg.to_i == i
      print '*'
    elsif min.to_i == i
      print 'V'
    elsif i.between?(min,max)
      print '|'
    elsif i % 5 == 0
      print '-'
    else
      print ' '
    end
  end
  puts ""
end
print '    '
for j in 1..table[0].size + 1
  if j == 1 || j % 5 == 0 || j == table[0].size
    print j
    if j+1 != table[0].size
      print '   '
    end
  end
end
print "[日]"
