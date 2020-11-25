class CreateDiscussiontopics < ActiveRecord::Migration[5.1]
  def change
    create_table :discussiontopics do |t|
      t.string :title
      t.references :campaign, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
