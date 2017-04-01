namespace :db do
  desc "Import data"
  task :remake_data do
    puts "**********Reset Database**********"
    Rake::Task["db:migrate:reset"].invoke
    puts "**********Create User**********"
    Rake::Task["db:users"].invoke
    puts "**********Create Invoice**********"
    Rake::Task["db:invoices2"].invoke
    puts "**********Create User Invoice**********"
    Rake::Task["db:user_invoices"].invoke
    puts "**********Update status for Invoice**********"
    Rake::Task["db:update_status"].invoke
    puts "**********Create Favorite List**********"
    Rake::Task["db:favorite_lists"].invoke
  end
end
