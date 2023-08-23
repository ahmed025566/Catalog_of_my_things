require_relative '../label'
require_relative '../book'

RSpec.describe Label do
  describe '#add_item' do
    it 'associates label with item and adds to items list' do
      label = Label.new('Test Label', 'Red')
      book = Book.new(1, '2023-08-01', 'Publisher', 'good')
      label.add_book(book)
      expect(book.label).to eq(label)
      expect(label.books.length).to eq(1)
    end
  end
end
