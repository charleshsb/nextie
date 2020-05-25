class CreateUnicorns < ActiveRecord::Migration[5.2]
  def change
    create_table :unicorns do |t|
      t.text :sex
      t.text :type
      t.text :color
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
