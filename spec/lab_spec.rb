describe 'Lab' do
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

end