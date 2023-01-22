# frozen_string_literal: true

class DeviseCreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false

      t.integer :number, null: false
      t.integer :unit_price, null: false
      t.integer :making_status, null: false, default: "0"

    end

    add_index :order_items, :email,                unique: true
    add_index :order_items, :reset_password_token, unique: true
    # add_index :order_items, :confirmation_token,   unique: true
    # add_index :order_items, :unlock_token,         unique: true
  end
end
