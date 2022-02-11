require 'rails_helper'

RSpec.describe '/professors', type: :feature do
  describe 'user story 1' do
    it 'shows all professors and attributes' do
      hagrid = Professor.create!(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create!(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      visit "/professors"

      save_and_open_page
      
      expect(page).to have_content(hagrid.name)
      expect(page).to have_content(hagrid.age)
      expect(page).to have_content(hagrid.specialty)
      expect(page).to have_content(lupin.name)
      expect(page).to have_content(lupin.age)
      expect(page).to have_content(lupin.specialty)
    end
  end
end
