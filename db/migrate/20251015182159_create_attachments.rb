class CreateAttachments < ActiveRecord::Migration[8.0]
  def change
    create_table :attachments do |t|
      t.references :post, null: false, foreign_key: true
      t.integer :kind
      t.string :file_url
      t.json :metadata

      t.timestamps
    end
  end
end
