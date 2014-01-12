class AddUrlToPost < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.string :url
    end

    Post.all.each do |p|
      p.update_attribute(:url, p.id)
    end
  end

  def self.down
    change_table :posts do |t|
      t.remove :url
    end
  end
end
