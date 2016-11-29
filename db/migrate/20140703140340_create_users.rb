class CreateUsers < ActiveRecord::Migration
  # Write your migrations here
  create_table :users do |t|
    t.string :name
    t.integer :nausea
    t.integer :happiness
    t.integer :tickets
    t.integer :height
  end
end
