class AddEmailToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :email, :string
    add_column :posts, :is_sent, :boolean, default: false
  end
end
