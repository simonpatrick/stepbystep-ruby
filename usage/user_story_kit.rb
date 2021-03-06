#!/usr/bin/env ruby
#
# Converts a collection of user stories in .CSV format into a Markdown document
# that can be then converted into a variety of other nifty common formats!
#
# Author: Preston Lee
#

require 'csv'

stories_file = ARGV[0]
markdown_file = "#{stories_file}.md"

if ARGV.size != 1 || !File.exists?(stories_file)
  puts "\n\tUsage: #{__FILE__} <my_user_stories.csv>\n"
  puts "\n\tSee template data file and README for an example.\n\n"
  exit 1
end


stories = []
first = true
labels = {}
puts "Reading data file..."
CSV.foreach(stories_file) do |row|
  if first
    first = false
    labels = row
  else
    benies = row[3..(row.size - 1)].reject {|s| s.nil? || s.empty?}.join(' and ')
    stories << {priority: row[0], role: row[1], feature: row[2], benefit: benies}
  end
end

puts "Sorting data..."
by_role = {}
stories.each do |n|
  unless by_role[n[:role]]
    by_role[n[:role]] = []
  end
  by_role[n[:role]] << n
end

by_priority = {}
stories.each do |n|
  unless by_priority[n[:priority]]
    by_priority[n[:priority]] = []
  end
  by_priority[n[:priority]] << n
end


def render_use_case(data, labels)
  "[#{data[:priority]}] #{labels[1]} #{data[:role]} #{labels[2]} #{data[:feature]} #{labels[3]} #{data[:benefit]}."
end

puts "Opening output file..."
f = File.open(markdown_file, 'w')
f.write("\# User Stories\n\n")
f.write("#{stories.count} stories total.\n")
f.write("#{by_role.count} roles defined.\n")
f.write("#{by_priority.count} priority levels.\n\n")

puts "Writing data..."
f.write("## By Role\n\n")

by_role.each do |k,v|
  f.write("\#\#\# #{k.capitalize}\n\n")
  v.each do |n|
    f.write(" * #{render_use_case(n, labels)}\n")
  end
  f.write("\n")
end


f.write("## By Priority\n\n")

by_priority.each do |k,v|
  f.write("\#\#\# #{k.capitalize}\n\n")
  v.each do |n|
    f.write(" * #{render_use_case(n, labels)}\n")
  end
  f.write("\n")
end

puts "Closing up shop..."
f.close
puts "Done!"
exit 0