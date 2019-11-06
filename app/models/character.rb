class Character < ApplicationRecord
  has_many :skill

  validates_presence_of :name,:charisma,:constitution,:dexterity,:intelligence,:strength,:wisdom
  validates_inclusion_of :wisdom,:strength,:intelligence,:dexterity,:constitution,:charisma , :in => 1..20

end
