class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles
  has_many :steps
  belongs_to :resource, :polymorphic => true

  #validates :resource_type, :inclusion => { :in => Rolify.resource_types }, :allow_nil => true

  scopify #scopes de la gema rolify
end
