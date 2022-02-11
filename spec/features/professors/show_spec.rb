require 'rails_helper'

RSpec.describe '/professors/:id', type: :feature do
  describe 'user story 2' do
    it 'shows specific professor and their students' do
      hagrid = Professor.create!(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create!(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: harry.id, professor_id: hagrid.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: hagrid.id)

      visit "/professors/#{hagrid.id}"

      expect(page).to have_content(hagrid.name)
      expect(page).to_not have_content(lupin.name)
      expect(page).to have_content(harry.name)
      expect(page).to have_content(longbottom.name)
    end
  end

  describe 'user story 4' do
    it 'shows student avg age per professor' do
      hagrid = Professor.create!(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
      weasley = Student.create(name: "George Weasley" , age: 14 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: harry.id, professor_id: hagrid.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: hagrid.id)
      ProfessorStudent.create(student_id: weasley.id, professor_id: hagrid.id)

      visit "/professors/#{hagrid.id}"
      save_and_open_page
      expect(page).to have_content(hagrid.name)
      expect(page).to have_content("Average Age of Students: 12")
    end
  end
end
