class AddTeamNameToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :team_name, :string
  end
end
