class ChangeColumnAuthorIdIdToAuthorId < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :AuthorId_id, :Author_id
  end
end
