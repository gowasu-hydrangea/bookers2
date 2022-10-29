class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  # modelファイルにアソシエーションの記載
  has_many :books, dependent:  :destroy
  
  # bookのindexページの左側の作成(User info)
  # Userモデルにnameとintroductionに加えて画像を扱うためのimageカラムが追記されたかのように扱うことができる
  has_one_attached :profile_image
  
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end
  
  # バリテーションの実装＞ユーザーのプロフィール更新が失敗した時
  validates :name, presence: true
  # validates :introduction
  
end
