class Book < ApplicationRecord
  # Book用のmodelファイルの作成にて
  has_one_attached :image
  # modelファイルにアソシエーションの記載
  belongs_to :user
  
  # バリテーションの実装＞新規投稿が失敗したとき
  validates :title, presence: true
  validates :body, presence: true
end
