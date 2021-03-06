require 'rails_helper'

describe Location do 
	it { is_expected.to validate_presence_of :ssid }
	it { is_expected.to validate_presence_of :place_name }


	let(:valid_location) { new_location = Location.create(
		address: nil,
		ssid: "Guest",
		place_name: "My Mommas house",
		boro: "SI",
		details: "Second floor gets best signal",
		latitude: "42.9043",
		longitude: "-72.8394"
		)}

	let(:no_address_or_coords) { nowhere = Location.create(
		address: nil,
		latitude: nil,
		longitude: nil,
		ssid: "hello",
		place_name: "nowhere"
		)}

	it "is valid ssid and place_name" do 
		expect(valid_location).to be_valid
	end

	it "needs to have either an address or lat/long coordinates" do
		expect(no_address_or_coords).to_not be_valid
	end

end