class AddDescriptionToWIkiPost < ActiveRecord::Migration[8.0]
  def change
    add_column :wiki_posts, :description, :string
  end
end
