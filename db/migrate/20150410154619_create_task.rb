class CreateTask < ActiveRecord::Migration
  def change
  	create_table :donnees do |t| #create you table within this file before use rake db:migrate
  		t.string :content
  		t.timestamps
  	end
  end
end
