class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.datetime :upload_date
      t.string :address
      t.decimal :lat, :precision => 10, :scale => 6 
      t.decimal :lng, :precision => 10, :scale => 6
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :documents, :users
  end
end
