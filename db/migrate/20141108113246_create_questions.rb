class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :number, null: false
      t.text   :text, null: false
      t.text   :answer, null: false
      t.string :game_slug, null: false
      t.string :acceptance_criteria
      t.text   :comment
      t.text   :source
      t.string :authors_names
    end
  end
end
