class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer     :team_red_id      , null: false
      t.integer     :team_blue_id     , null: false
      t.datetime    :started_at       , null: false       , default: Time.zone.now
      t.datetime    :ended_at         , null: true
      t.integer     :team_red_score   , null: false       , default: 0
      t.integer     :team_blue_score  , null: false       , default: 0

      t.timestamps
    end

    add_foreign_key :games, :teams, column: :team_red_id , name: 'FK_GAMES_TEAM_RED'
    add_foreign_key :games, :teams, column: :team_blue_id, name: 'FK_GAMES_TEAM_BLUE'
  end
end
