require 'rails_helper'

RSpec.describe '/professors', type: :feature do
  describe 'user story 1' do
    it 'shows all professors and attributes' do
      hagrid = Professor.create!(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create!(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      visit "/professors"

      expect(page).to have_content(hagrid.name)
      expect(page).to have_content(hagrid.age)
      expect(page).to have_content(hagrid.specialty)
      expect(page).to have_content(lupin.name)
      expect(page).to have_content(lupin.age)
      expect(page).to have_content(lupin.specialty)
    end
  end

  describe 'extension' do
    it 'shows all professors in alphabetical order' do
      hagrid = Professor.create!(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create!(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
      snape = Professor.create!(name: "Severus Snape", age: 52 , specialty: "Potions")

      visit "/professors"

      within('#prof-0') do
        expect(page).to have_content(lupin.name)
      end

      within('#prof-1') do
        expect(page).to have_content(hagrid.name)
      end

      within('#prof-2') do
        expect(page).to have_content(snape.name)
      end
    end
  end
end
