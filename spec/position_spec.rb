# frozen_string_literal: true

require './lib/position'

describe Position do
  describe '#initialize' do
    let(:position) { Position.new(x_coord, y_coord, direction) }
    let(:x_coord) { 0 }
    let(:y_coord) { 1 }
    let(:direction) { 'WEST' }

    it 'should have a valid x_coord attribute' do
      expect(position.x_coord).to eq x_coord
    end

    it 'should have a valid y_coord attribute' do
      expect(position.y_coord).to eq y_coord
    end

    it 'should have a valid direction attribute' do
      expect(position.direction).to eq direction
    end
  end

  describe '#move' do
    context 'when direction is NORTH' do
      let(:position) { Position.new(1, 1, direction) }
      let(:direction) { 'NORTH' }
      let(:new_position) { position.move(direction) }

      it 'should move NORTH' do
        # Position.new(1, 2, direction)
        expect(new_position.x_coord).to eq 1
        expect(new_position.y_coord).to eq 2
        expect(new_position.direction).to eq direction
      end
    end

    context 'when direction is EAST' do
      let(:position) { Position.new(1, 1, direction) }
      let(:direction) { 'EAST' }
      let(:new_position) { position.move(direction) }

      it 'should move EAST' do
        # Position.new(2, 1, direction)
        expect(new_position.x_coord).to eq 2
        expect(new_position.y_coord).to eq 1
        expect(new_position.direction).to eq direction
      end
    end

    context 'when direction is SOUTH' do
      let(:position) { Position.new(1, 1, direction) }
      let(:direction) { 'SOUTH' }
      let(:new_position) { position.move(direction) }

      it 'should move SOUTH' do
        # Position.new(1, 0, direction)
        expect(new_position.x_coord).to eq 1
        expect(new_position.y_coord).to eq 0
        expect(new_position.direction).to eq direction
      end
    end

    context 'when direction is WEST' do
      let(:position) { Position.new(1, 1, direction) }
      let(:direction) { 'WEST' }
      let(:new_position) { position.move(direction) }

      it 'should move WEST' do
        # Position.new(0, 1, direction)
        expect(new_position.x_coord).to eq 0
        expect(new_position.y_coord).to eq 1
        expect(new_position.direction).to eq direction
      end
    end

    context 'when direction is not valid' do
      let(:position) { Position.new(1, 1, direction) }
      let(:direction) { 'UP' }

      it 'should move NORTH' do
        expect(position.move(direction)).to eq nil
      end
    end
  end

  describe '#right' do
    context 'when direction is NORTH' do
      let(:position) { Position.new(1, 1, 'NORTH') }

      it 'should return EAST' do
        expect(position.right).to eq 'EAST'
      end
    end

    context 'when direction is EAST' do
      let(:position) { Position.new(1, 1, 'EAST') }

      it 'should return SOUTH' do
        expect(position.right).to eq 'SOUTH'
      end
    end

    context 'when direction is SOUTH' do
      let(:position) { Position.new(1, 1, 'SOUTH') }

      it 'should return WEST' do
        expect(position.right).to eq 'WEST'
      end
    end

    context 'when direction is WEST' do
      let(:position) { Position.new(1, 1, 'WEST') }

      it 'should return NORTH' do
        expect(position.right).to eq 'NORTH'
      end
    end
  end

  describe '#left' do
    context 'when direction is NORTH' do
      let(:position) { Position.new(1, 1, 'NORTH') }

      it 'should return WEST' do
        expect(position.left).to eq 'WEST'
      end
    end

    context 'when direction is EAST' do
      let(:position) { Position.new(1, 1, 'EAST') }

      it 'should return NORTH' do
        expect(position.left).to eq 'NORTH'
      end
    end

    context 'when direction is SOUTH' do
      let(:position) { Position.new(1, 1, 'SOUTH') }

      it 'should return EAST' do
        expect(position.left).to eq 'EAST'
      end
    end

    context 'when direction is WEST' do
      let(:position) { Position.new(1, 1, 'WEST') }

      it 'should return SOUTH' do
        expect(position.left).to eq 'SOUTH'
      end
    end
  end
end
