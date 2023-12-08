class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :text, presence: true
      t.references :profile, null: false, foreign_key: true, type: :uuid
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
