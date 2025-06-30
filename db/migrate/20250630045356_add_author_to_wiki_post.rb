class AddAuthorToWikiPost < ActiveRecord::Migration[8.0]
  def change
    add_column :wiki_posts, :author, :string
  end
end
