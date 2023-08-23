require_relative '../book'

RSpec.describe Book do
  describe '#can_be_archived?' do
    it 'returns true for a book with bad cover' do
      book = Book.new(1, '2023-08-01', 'Publisher', 'bad')
      expect(book.can_be_archived?).to eq(true)
    end

    it 'returns false for a book with good cover' do
      book = Book.new(1, '2023-08-01', 'Publisher', 'good')
      expect(book.can_be_archived?).to eq(false)
    end
  end
end
