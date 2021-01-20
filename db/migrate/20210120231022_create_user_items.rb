class CreateUserItems < ActiveRecord::Migration[6.0]
  def change
    create_table :user_items do |t|
      t.references :user, null: false, forenign_key: true
      t.references :item, null: false, forenign_key: true
      t.timestamps
    end
  end
end
