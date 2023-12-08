class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :genre
      t.integer :pages
      t.integer :year_of_publishing
      t.references :author, foreign_key: { to_table: :profiles }, type: :uuid

      t.timestamps
    end
  end
end
