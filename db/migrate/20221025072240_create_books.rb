class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      # Book用のmodelファイルの作成にて
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
