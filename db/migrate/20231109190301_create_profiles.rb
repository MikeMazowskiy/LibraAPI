class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles, id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :nick_name
      t.string :full_name
      t.integer :age
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.boolean :author

      t.timestamps
    end
  end
end

