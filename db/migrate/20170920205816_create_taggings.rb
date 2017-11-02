class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name, index: { unique: true }

      t.timestamps null: false
    end

    create_table :taggings do |t|
      t.belongs_to :article, foreign_key: true
      t.belongs_to :tag, foreign_key: true

      t.timestamps null: false
    end
  end
end
