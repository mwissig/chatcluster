
desc "This task is called by the Heroku scheduler add-on"
task :delete_old_posts => :environment do
  puts "Deleting old posts"
  Post.where('created_at < ?', 14.days.ago).each do |post|
    post.destroy
  end
  puts "done."
end
