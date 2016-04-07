class AddColumnCreatedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :created, :date
  end
end
