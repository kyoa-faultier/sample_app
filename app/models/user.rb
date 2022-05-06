class User < ApplicationRecord
  before_save { self.email = self.email.downcase }
  # セーブする前に渡されたemailアドレスを強制的に小文字にする
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }
  # 存在性をチェック
  

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # 全部大文字の変数は定数
  # 文字列を並び替えたりしちゃだめよ
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    #メアドは大文字小文字区別しない
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
