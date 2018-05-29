#!/usr/bin/env ruby
# coding: utf-8

@max = 0.0
@min = 0.0
@header = ""
@max_str = ""
@min_str = ""
@sw = 0

ary = ["平均気温", "最高気温", "最低気温"]
if ARGV[0].to_i.between?(3,5)
  @sw = ARGV[0].to_i
else
  puts "第一引数で3, 4, 5のいずれかを入力してください。"
  puts "3は平均気温, 4は最高気温, 5は最低気温です"
  exit(0)
end

for i in 1...ARGV.size
  path = ARGV[i]
  open(path, 'r:utf-8') do |file|
    @header = file.first
    file.each do |line|
      fields = line.chomp.split(',')
      if fields[@sw].to_f > @max
        @max = fields[@sw].to_f
        @max_str = line
      end
      if fields[@sw].to_f < @min
        @min = fields[@sw].to_f
        @min_str = line
      end
    end
  end
end
puts '#'+@header
puts '#'+@max_str
puts '#'+@min_str
puts '# '+ary[@sw-3]+'の最高値 ' + @max.to_s + '度'
puts '# '+ary[@sw-3]+'の最低値 ' + @min.to_s + '度'
puts @max - @min
