class AddIpToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :ip, :inet
  end
end
