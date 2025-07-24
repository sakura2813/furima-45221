class User < ApplicationRecord
  has_many :items
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ニックネームと誕生日
  validates :nickname, presence: true
  validates :birth_date, presence: true

  # 名前：全角ひらがな・カタカナ・漢字
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }

  # 名前（カナ）：全角カタカナ
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }

  # パスワード：英数字混合（Deviseのvalidatableがあるのでカスタムする場合のみ）
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/ }
end
