namespace :db do
  
  desc "Drop database and run migrations and fixtures"
  
  task(:bootstrap => :environment) do
    puts 'DROPPING DATABASE'
    system "rake db:drop"
    puts 'Database successfully dropped'
    
    puts 'CREATING DATABASE'  
    system "rake db:create"
    puts 'Database successfully created'
       
    puts 'MIGRATION STARTS'
    system "rake db:migrate"
    puts 'migration done'
      
    puts 'LOADING FIXTURES'
    system "rake db:fixtures:load"
    puts 'Fixtures successfully loaded'
    
  end

end