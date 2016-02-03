class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :subject
      t.string :email
      t.text :comment

      t.timestamps
    end
  end
end
