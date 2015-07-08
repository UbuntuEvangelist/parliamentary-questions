desc 'Creates folder and fills it with all the trimlinks'
task :export_trim_links, [:new_dir]  => :environment do |t, args|

  args.with_defaults(new_dir: '../trimlinks/')
  new_dir = args[:new_dir]

  Dir.mkdir(new_dir) unless Dir.exist?(new_dir)
  new_dir = new_dir +'/' if new_dir[-1, 1] != '/'

  TrimLink.all.each { |tl|
    file_to_write = new_dir + tl.pq_id.to_s + '.tr5'
    File.open(file_to_write,'w'){ |f| f.write(tl.data) }
  }
end

