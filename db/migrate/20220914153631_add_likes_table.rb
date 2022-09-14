class AddLikesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :Author, foreign_key: { to_table: 'users' }
      t.references :Post, foreign_key: { to_table: 'posts' }

      t.timestamps
    end
  end
end
