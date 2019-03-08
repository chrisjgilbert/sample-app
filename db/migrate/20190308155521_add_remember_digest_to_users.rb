class AddRememberDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remeber_me_digest, :string
  end
end
