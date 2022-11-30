# frozen_string_literal: true

RSpec.describe Parking do
  it "Tiene un número de version, usando la sintaxis semántica X.Y.Z" do
    expect(Parking::VERSION).not_to be nil
  end
end
