class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :content, null: false
      t.timestamps null: false
    end

    add_reference :entries, :user, index: true, foreign_key: true
  end
end
