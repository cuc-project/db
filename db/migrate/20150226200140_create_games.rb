class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :competition
      t.string :tour
      t.string :season
      t.string :cup_name
      t.string :elitar_name
      t.string :level
      t.string :authors
      t.string :editors
      t.text   :additional_info
      t.string :game_slug
      t.string :submitter
      t.integer :number_questions
      t.datetime :date

      t.timestamps
    end
  end
end
