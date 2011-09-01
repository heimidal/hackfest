require 'spec_helper'

describe Asciify do
  let(:message) { 'beer' }
  let(:results) do
    {
      results: []
    }
  end

  before { GoogleAjax::Search.should_receive(:images).with(message).and_return(results) }

  it "generates a gallery" do
    Asciify.generate_gallery("beer").should be_a(Asciify::Gallery)
  end
end
