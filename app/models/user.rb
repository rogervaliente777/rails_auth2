class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :jwt_token, type: String
  field :email, type: String
  field :password, type: String
  field :password_confirmation, type: String
  field :is_valid, type: Boolean, default: false
  field :session_token_id, type: BSON::ObjectId
  field :otp_code, type: Integer

  belongs_to :user_session, optional: true, inverse_of: :user

  validates :name, presence: { message: "Nombre requerido" }
  validates :email, presence: { message: "Correo electrónico requerido" }, uniqueness: { message: "Este correo ya está en uso" }
  validates :password, presence: { message: "Contraseña requerida" }, confirmation: { message: "La confirmación de la contraseña no coincide" }
  validates :jwt_token, uniqueness: { message: "Este token ya esta en uso" }
end
