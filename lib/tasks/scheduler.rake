
desc "This task is called by the Heroku scheduler add-on"
task :delete_old_posts => :environment do
  puts "Deleting old posts"
  Post.delete_all ["created_at < ?", 14.days.ago]
  puts "done."
end
