class CreateTestTable < ActiveRecord::Migration
  def change
    create_table :test_entities do |t|
      t.string :email, null: false, default: ''
      t.datetime :remember_created_at
      t.integer :sign_in_count, default: 0
      t.datetime :current_sign_in_at
      t.string :current_sign_in_ip
      t.integer :failed_attempts, default: 0 # Only if lock strategy is :failed_attempts
      t.datetime :locked_at
      t.string :provider
      t.string :uid
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.text :description

      t.timestamps
    end
  end
end
