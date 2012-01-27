# --1257--

count = 0
while count < ARGV[0].to_i
  script = open('run.rb', 'r+')
  content = script.read

  if content =~ /--(\d+)--/
    count = $1.to_i if count == 0

    count += 1

    script.rewind
    script.write(content.gsub(/--\d+--/, "--#{count}--"))
    script.close
    system("git commit -am 'Running you up to #{count} commits'")
  else
    exit
  end
end
