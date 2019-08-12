describe 'Specification' do
  describe 'GIVEN a title and description' do
    title = 'My new lesson'
    description = 'It is going to teach some things'

    describe 'WHEN Lab.new is passed the title and description' do
      result = Lab.new(title, description)

      it 'THEN #title is equal to the passed in title' do
        expect(result.title).to eq(title)
      end

      it 'AND #description is equal to the passed in description' do
        expect(result.description).to eq(description)
      end
    end
  end

  describe 'GIVEN three lab objects, lab_1, lab_2 and lab_3' do
    lab_1 = Lab.new('Learn Git', 'We are going to learn Git')
    lab_2 = Lab.new('Learn Ruby', 'We are going to learn Ruby')
    lab_3 = Lab.new('Learn JavaScript', 'We are going to learn JavaScript')

    describe 'WHEN Course.new is passed an array of these labs' do
      result = Course.new([lab_1, lab_2, lab_3])

      it 'THEN #labs is equal to a hash of the labs keyed by their object_ids' do
        expect(result.labs).to eq({
          lab_1.object_id => lab_1,
          lab_2.object_id => lab_2,
          lab_3.object_id => lab_3
        })
      end
    end
  end
end