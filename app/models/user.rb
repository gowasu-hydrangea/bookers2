class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  # modelファイルにアソシエーションの記載
  has_many :books, dependent:  :destroy
  
  # bookのindexページの左側の作成(User info)
  # Userモデルにnameとintroductionに加えて画像を扱うためのimageカラムが追記されたかのように扱うことができる
  has_one_attached :image
  
  # バリテーションの実装＞ユーザーのプロフィール更新が失敗した時
  validates :name, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
  
end
