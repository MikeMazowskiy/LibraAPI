class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.references :profile, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_reference :books, :list, foreign_key: true

    create_table :lists_books do |t|
      t.references :book, foreign_key: true, null: false
      t.references :list, foreign_key: true, null: false

      t.timestamps
    end

    add_index :lists_books, [:book_id, :list_id], unique: true
  end
end
