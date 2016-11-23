namespace :db do
  desc "get pinyin names of all leaders"
  task :get_leaders_pinyin_names => :environment do
    Leader.all.each do |leader|
      pinyin = PinYin.of_string(leader.name).map { |value| value.to_s[0] }.join
      if leader.update(pinyin: pinyin)
        puts "get #{leader.name}'s pinyin: #{pinyin}"
      else
        "there's something wrong when processing #{leader.name}'s name"
      end
    end
  end
end
