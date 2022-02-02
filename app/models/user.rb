# frozen_string_literal: true

# unique string indentifier for product
class User < ApplicationRecord
  has_secure_password
end
