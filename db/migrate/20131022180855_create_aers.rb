class CreateAers < ActiveRecord::Migration
  def change
    create_table :aers do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
