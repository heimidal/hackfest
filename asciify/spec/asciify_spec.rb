require 'spec_helper'

describe Asciify do
  let(:message) { 'beer' }
  let(:results) do
    {
      results: []
    }
  end

  before {}

  it "retrieves a collection of images from Google" do
    GoogleAjax::Search.should_receive(:images).with(message).and_return(results) 
    Asciify.generate_gallery("beer")
  end
end

describe Asciify::GalleryImage do
  let(:url) { "http://www.example.com/image.jpg" }
  let(:params) { {url: url} }
  subject { Asciify::GalleryImage.new(params) }

  it "has a url" do
    subject.url.should == url
  end

  its(:ascii_url) { should == "http://skeeter.blakesmith.me/?image_url=#{url}" }

  context 'by default' do
    let(:width) { Asciify::GalleryImage::DEFAULT_WIDTH }

    it 'gets results from its url' do
      subject.stub(:ascii_url) { "http://www.example.com/?url=#{url}" }
      HTTParty.should_receive(:get).with("http://www.example.com/?url=#{url}&width=#{width}").and_return("test\nme")
      subject.to_ascii.should == ["test", "me"]
    end
  end

  context 'when called with a specific width' do
    let(:width) { 30 }

    it 'gets results from its url' do
      subject.stub(:ascii_url) { "http://www.example.com/?url=#{url}" }
      HTTParty.should_receive(:get).with("http://www.example.com/?url=#{url}&width=#{width}").and_return("test\nme")
      subject.to_ascii(width).should == ["test", "me"]
    end
  end

end
