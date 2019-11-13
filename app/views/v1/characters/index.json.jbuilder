json.array! @characters do |character|
  level = (character.strength + character.dexterity +
              character.constitution + character.intelligence +
              character.wisdom + character.charisma) / 6

  json.id character.id
  json.name character.name
  json.strength character.strength
  json.dexterity character.dexterity
  json.constitution character.constitution
  json.intelligence character.intelligence
  json.wisdom character.wisdom
  json.charisma character.charisma
  json.level level
  if level >= 1 && level <= 4
    proficient = 2
  elsif level >= 5 && level <= 8
    proficient = 3
  elsif level >= 9 && level <= 12
    proficient = 4
  elsif level >= 13 && level <= 16
    proficient = 5
  elsif level >= 17 && level <= 20
    proficient = 6
  end
  json.proficiency_bonus proficient
  json.skills character.skill do |skill|
    json.id skill.id
    json.name skill.name
    json.ability skill.ability
    json.proficient skill.proficient
  end
end
