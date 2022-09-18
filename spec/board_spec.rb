# frozen_string_literal: true

require './lib/board'
require './lib/position'

describe Board do
  describe '#initialize' do
    context 'with default height and width' do
      let(:board) { Board.new }
      let(:default_height) { 5 }
      let(:default_width) { 5 }

      it 'should have a default height of 5' do
        expect(board.height).to eq default_height
      end

      it 'should have a default width of 5' do
        expect(board.width).to eq default_width
      end
    end

    context 'with specified height and width' do
      let(:board) { Board.new(height: height, width: width) }
      let(:height) { 6 }
      let(:width) { 6 }

      it 'should have a height that matches the height param' do
        expect(board.height).to eq height
      end

      it 'should have a width that matches the width param' do
        expect(board.width).to eq width
      end
    end
  end

  describe '#valid_position?' do
    let(:board) { Board.new }

    context 'when the position is valid' do
      let(:position) { Position.new(1, 1, 'NORTH') }

      it { expect(board.valid_position?(position)).to be true }
    end

    context 'when the x coordinate is too large' do
      let(:position) { Position.new(9, 1, 'NORTH') }

      it { expect(board.valid_position?(position)).to be false }
    end

    context 'when the x coordinate is too small' do
      let(:position) { Position.new(-1, 1, 'NORTH') }

      it { expect(board.valid_position?(position)).to be false }
    end

    context 'when the y coordinate is too large' do
      let(:position) { Position.new(1, 9, 'NORTH') }

      it { expect(board.valid_position?(position)).to be false }
    end

    context 'when the y coordinate is too small' do
      let(:position) { Position.new(1, -1, 'NORTH') }

      it { expect(board.valid_position?(position)).to be false }
    end

    context 'when the x and y coordinates are too large' do
      let(:position) { Position.new(9, 9, 'NORTH') }

      it { expect(board.valid_position?(position)).to be false }
    end

    context 'when the x and y coordinates are too small' do
      let(:position) { Position.new(-1, -1, 'NORTH') }

      it { expect(board.valid_position?(position)).to be false }
    end
  end
end
