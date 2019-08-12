describe 'Specification' do
  describe 'GIVEN a title and description' do
    title = 'My new lesson'
    description = 'It is going to teach some things'

    describe 'WHEN lab = Lab.new(title, description)' do
      result = Lab.new(title, description)

      it 'THEN lab#title is equal to the passed in title' do
        expect(result.title).to eq(title)
      end

      it 'AND lab#description is equal to the passed in description' do
        expect(result.description).to eq(description)
      end
    end
  end

  describe 'GIVEN three lab objects, lab_1, lab_2 and lab_3' do
    lab_1 = Lab.new('Learn Git', 'We are going to learn Git')
    lab_2 = Lab.new('Learn Ruby', 'We are going to learn Ruby')
    lab_3 = Lab.new('Learn JavaScript', 'We are going to learn JavaScript')

    describe 'WHEN course = Course.new([lab_1, lab_2, lab_3])' do
      course = Course.new([lab_1, lab_2, lab_3])

      it 'THEN course#labs is equal to an array of the labs' do
        expect(course.labs).to eq([lab_1, lab_2, lab_3])
      end

      it "AND lab_1#courses is an array containing the course" do
        expect(lab_1.courses).to include(course)
      end

      describe 'AND we create a new lab' do
      lab = Lab.new('Lab title', 'Lab description')

        it "THEN course#add_lab adds the lab to the course" do
          course.add_lab(lab)
          expect(course.labs).to include(lab)
        end
      end
    end
  end
end