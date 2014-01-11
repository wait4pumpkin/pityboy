class AddAccountToPost < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.integer :account_id
    end

    account = Account.first
    Post.all.each do |p|
      p.update_attribute(:account, account)
    end
  end

  def self.down
    change_table :posts do |t|
      t.remove :account_id
    end
  end
end
