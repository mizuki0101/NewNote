class CreateTagNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_notes do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :note, null: false, foreign_key: true
      t.timestamps
    end
  end
end
