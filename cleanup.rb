#!/usr/bin/env ruby
# coding: utf-8

require 'fileutils'

month = ["January", "February", "March", "April", "May", "June",
         "July", "August", "September", "November", "October", "December"]

Dir.glob("*") do |file|
  if (not File.ftype(file) == 'directory')
    puts file +' ・・・ 対象外'
    next
  else
    if (not file.to_i.between?(1900, 2099))
      puts file +' ・・・ 対象外'
      next
    else
      puts file +' ・・・ チェック'
      if (not Dir[file+'/*'].empty?)
        Dir.foreach(file+'/') do |f|
          if f == '.' || f == '..'
            next
          end
          if month.include?(File.basename(f, '.csv'))
            puts '  '+ f +' ・・・ 削除'
            File.delete(file+'/'+f)
          else
            puts '  '+ f +' ・・・ 対象外'
          end
        end
      end
      if (not Dir[file+'/*'].empty?)
        puts file +' ・・・ スキップ'
        next
      end
      Dir.rmdir(file)
      puts file + ' ・・・ 削除'
    end
  end
end
