desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Deleting old posts"
  Post.where(['created_at < ?', 30.days.ago]).destroy_all
  puts "done."
end
