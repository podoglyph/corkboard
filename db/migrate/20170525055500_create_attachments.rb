class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.integer :attachable_id, index: true
      t.string :attachable_type, index: true

      t.timestamps null: :false
    end
  end
end
