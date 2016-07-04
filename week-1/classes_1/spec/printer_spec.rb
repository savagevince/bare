require 'printer'

describe Printer do
  subject(:printer) { described_class.new }

  describe '#print_answer' do
    it 'pretty prints the answer' do
      expect(printer.print_answer(4)).to eq "The Answer is: 4"
      expect(printer.print_answer(6)).to eq "The Answer is: 6"
      expect(printer.print_answer(-1)).to eq "The Answer is: -1"
      expect(printer.print_answer(0)).to eq "The Answer is: 0"
      expect(printer.print_answer(Float::INFINITY)).to eq "The Answer is: Infinity"
    end
  end
end