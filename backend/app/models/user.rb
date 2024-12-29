class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :user_biomarkers
  has_many :biomarkers, through: :user_biomarkers
  has_many :biomarker_records

  def jwt_payload
    { 'foo' => 'bar' }
  end
end
