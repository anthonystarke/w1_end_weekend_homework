def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,money)
  return pet_shop[:admin][:total_cash] += money
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop,amount)
  return pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, breed_name)
  breed_count = []
  for breed in pet_shop[:pets]
    breed_count << breed[:breed] if breed[:breed] == breed_name
    # breed_count += 1
  end
  return breed_count
end

def find_pet_by_name(pet_shop, search_pet_name)
  for pet_name in pet_shop[:pets]
    return pet_name if search_pet_name == pet_name[:name]
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop,new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, money)
  customer[:cash] -= money
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer,new_pet)
  customer[:pets] << new_pet
end

# Optional

def customer_can_afford_pet(customer,new_pet)
  if customer[:cash] > new_pet[:price]
    return true
  end
  return false
end

def sell_pet_to_customer(pet_shop,pet,customer)

  if pet == nil
    return
  end

  if customer_can_afford_pet(customer,pet) == true
    remove_pet_by_name(pet_shop,pet)
    remove_customer_cash(customer,pet[:price])
    add_or_remove_cash(pet_shop,pet[:price])
    pet_shop[:admin][:pets_sold] += 1
    add_pet_to_customer(customer,pet)
  end
end
