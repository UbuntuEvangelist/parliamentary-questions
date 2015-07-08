desc 'Creates folder and fills it with all the trimlinks'
task :export_trim_links  => :environment do

  new_dir = '../trimlinks/'
  TrimLink.all.each { |tl|
    file_to_write = new_dir + tl.pq_id.to_s + '.tr5'
    File.open(file_to_write,'w'){ |f| f.write(tl.data) }
  }
end

