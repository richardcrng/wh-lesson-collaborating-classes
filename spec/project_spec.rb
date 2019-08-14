describe 'GIVEN a title and a description' do
  title = 'My first lab'
  description = 'I am making a lab'

  describe 'WHEN I pass the title and description to Lab.new' do
    lab = Lab.new(title, description)

    it 'THEN the resulting lab should have lab.title equal to the passed in title' do
      expect(lab.title).to eq(title)
    end

    it 'AND the resulting lab should have title.description equal to the passed in description' do
      expect(lab.description).to eq(description)
    end
  end
end