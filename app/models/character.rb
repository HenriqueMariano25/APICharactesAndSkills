class Character < ApplicationRecord
  has_many :skill

  scope :str_gt, ->(p) { where('strength > ?', p) if p.present? }
  scope :str_lt, ->(p) { where('strength < ?', p) if p.present? }
  scope :dex_gt, ->(p) { where('dexterity > ?', p) if p.present? }
  scope :dex_lt, ->(p) { where('dexterity < ?', p) if p.present? }
  scope :con_gt, ->(p) { where('constitution > ?', p) if p.present? }
  scope :con_lt, ->(p) { where('constitution < ?', p) if p.present? }
  scope :int_gt, ->(p) { where('intelligence > ?', p) if p.present? }
  scope :int_lt, ->(p) { where('intelligence < ?', p) if p.present? }
  scope :wis_gt, ->(p) { where('wisdom > ?', p) if p.present? }
  scope :wis_lt, ->(p) { where('wisdom < ?', p) if p.present? }
  scope :cha_gt, ->(p) { where('charisma > ?', p) if p.present? }
  scope :cha_lt, ->(p) { where('charisma < ?', p) if p.present? }
  scope :character_name, ->(p) { where("name like ?","%#{p}%") if p.present? }


  validates_presence_of :name,:charisma,:constitution,:dexterity,:intelligence,:strength,:wisdom
  validates_inclusion_of :wisdom,:strength,:intelligence,:dexterity,:constitution,:charisma , :in => 1..20

end
