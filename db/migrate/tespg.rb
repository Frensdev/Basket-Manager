require 'pg'

conn=PGconn.connect( :hostaddr=>"127.0.0.1", :port=>5432, :dbname=>"megatest", :user=>"roger", :password=>'123456')