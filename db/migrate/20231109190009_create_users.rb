class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string :email, presence: true, null: false

      t.timestamps
    end
  end
end
