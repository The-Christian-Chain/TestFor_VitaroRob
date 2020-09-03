class DeleteBlogColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :editor
    remove_column :posts, :excerpt
    add_column :posts, :location, :string
  end
end
