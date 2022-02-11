require 'rails_helper'

RSpec.describe '/students', type: :feature do
  describe 'user story 3' do
    it 'shows list of students and number of professors per student' do
      hagrid = Professor.create!(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create!(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
      mcgonagall = Professor.create!(name: "Minverva McGonagall", age: 204 , specialty: "Transfiguration")
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
      granger = Student.create(name: "Hermione Granger" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student_id: harry.id, professor_id: hagrid.id)
      ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
      ProfessorStudent.create(student_id: longbottom.id, professor_id: hagrid.id)
      ProfessorStudent.create(student_id: granger.id, professor_id: hagrid.id)
      ProfessorStudent.create(student_id: granger.id, professor_id: lupin.id)
      ProfessorStudent.create(student_id: granger.id, professor_id: mcgonagall.id)

      visit "/students"
      save_and_open_page

      expect(page).to_not have_content(lupin.name)
      expect(page).to have_content("#{harry.name}: 2")
      expect(page).to have_content("#{longbottom.name}: 1")
      expect(page).to have_content("#{granger.name}: 3")
    end
  end
end
