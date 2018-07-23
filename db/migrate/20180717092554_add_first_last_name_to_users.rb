class AddFirstLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :text
    add_column :users, :last_name, :text
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
