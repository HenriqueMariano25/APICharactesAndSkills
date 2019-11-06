json.array! @skills do |skill|
  json.id skill.id
  json.name skill.name
  json.ability skill.ability
  json.proficient skill.proficient
end
