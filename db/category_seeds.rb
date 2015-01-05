module CategorySeeds

  def self.all_attributes
    { :medical         => { name: 'Medical and Hygiene' },
      :food_and_water  => { name: 'Food and Water' },
      :energy_and_heat => { name: 'Energy and Heat' },
      :childcare       => { name: 'Childcare' },
      :clothing        => { name: 'Clothing' },
      :flood_relief    => { name: 'Flood Relief' },
      :tools           => { name: 'Tools' },
      :shelter_bedding => { name: 'Shelter and Bedding' }
    }
  end

  def self.create_category(category)
    category = Category.create!(all_attributes[category])
  end

  def self.all_categories
    all_attributes.keys.dup
  end

end
