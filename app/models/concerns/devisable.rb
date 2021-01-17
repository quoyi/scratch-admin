# frozen_string_literal: true

module Devisable
  extend ActiveSupport::Concern

  included do
    attr_accessor :login

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :validatable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable,
           :trackable, authentication_keys: [:login]

    validates :mobile, presence: true,
                       uniqueness: true,
                       format: { with: /\A1[3-9]\d{9}\z/ },
                       unless: proc { |u| u.new_record? && u.guest? }
    validates :email, uniqueness: true,
                      format: { with: /\A[^@\s]+@[^@\s]+\z/i },
                      if: proc { |u| u.email.present? }
  end

  # override devise method to query user
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).find_by('mobile = :val OR email = :val', { val: login.downcase })
  end

  # override devise method to copy data from omniauth
  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
  #     user.email = data['email'] if data && user.email.blank?
  #   end
  # end

  def login
    nick || mobile || email
  end
end
