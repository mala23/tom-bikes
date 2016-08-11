require 'docking_station'

describe DockingStation do
  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(bike).to be_working
  end

  describe '#dock' do
    it'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it'raises an error when full' do
      subject.dock(Bike.new)
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end

  it'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
end

